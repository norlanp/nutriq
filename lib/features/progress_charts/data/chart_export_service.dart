import 'dart:typed_data';

import 'package:nutriq/core/utils/file_helper_io.dart'
    as file_helper;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ChartExportService {
  final ScreenshotController screenshotController;

  ChartExportService(this.screenshotController);

  Future<void> exportAndShare() async {
    final Uint8List? imageBytes = await screenshotController.capture(
      pixelRatio: 3.0,
    );
    if (imageBytes == null) return;

    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath =
        await file_helper.writeTempFile('chart_$timestamp.png', imageBytes);

    await Share.shareXFiles(
      [XFile(filePath)],
      text: 'Nutriq Progress Chart',
    );
  }
}
