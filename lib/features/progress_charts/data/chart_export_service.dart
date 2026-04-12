import 'dart:typed_data';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ChartExportService {
  final ScreenshotController screenshotController;

  ChartExportService(this.screenshotController);

  Future<void> exportAndShare() async {
    if (kIsWeb) {
      // On web, share via web API instead of file
      final Uint8List? imageBytes = await screenshotController.capture(
        pixelRatio: 3.0,
      );
      if (imageBytes == null) return;
      // Web share uses XFile from bytes directly
      final xFile =
          XFile.fromData(imageBytes, name: 'chart.png', mimeType: 'image/png');
      await Share.shareXFiles([xFile], text: 'Nutriq Progress Chart');
      return;
    }

    final Uint8List? imageBytes = await screenshotController.capture(
      pixelRatio: 3.0,
    );
    if (imageBytes == null) return;

    if (!file_helper.hasFileSupport) return;

    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String filePath =
        await file_helper.writeTempFile('chart_$timestamp.png', imageBytes);

    await Share.shareXFiles(
      [XFile(filePath)],
      text: 'Nutriq Progress Chart',
    );
  }
}
