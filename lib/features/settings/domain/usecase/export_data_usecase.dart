import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nutriq/core/domain/repository/intake_repository.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';

class ExportDataUsecase {
  final UserActivityRepository _userActivityRepository;
  final IntakeRepository _intakeRepository;
  final TrackedDayRepository _trackedDayRepository;

  ExportDataUsecase(this._userActivityRepository, this._intakeRepository,
      this._trackedDayRepository);

  Future<bool> exportData(
      String exportZipFileName,
      String userActivityJsonFileName,
      String userIntakeJsonFileName,
      String trackedDayJsonFileName) async {
    final userActivityJsonList =
        await _userActivityRepository.exportAllToJson();
    final userActivityJsonBytes =
        utf8.encode(jsonEncode(userActivityJsonList));

    final intakeJsonList = await _intakeRepository.exportAllToJson();
    final intakeJsonBytes = utf8.encode(jsonEncode(intakeJsonList));

    final trackedDayJsonList =
        await _trackedDayRepository.exportAllToJson();
    final trackedDayJsonBytes =
        utf8.encode(jsonEncode(trackedDayJsonList));

    final archive = Archive();
    archive.addFile(
      ArchiveFile(userActivityJsonFileName, userActivityJsonBytes.length,
          userActivityJsonBytes),
    );
    archive.addFile(
      ArchiveFile(
          userIntakeJsonFileName, intakeJsonBytes.length, intakeJsonBytes),
    );
    archive.addFile(
      ArchiveFile(trackedDayJsonFileName, trackedDayJsonBytes.length,
          trackedDayJsonBytes),
    );

    final zipBytes = ZipEncoder().encode(archive);
    final result = await FilePicker.platform.saveFile(
      fileName: exportZipFileName,
      type: FileType.custom,
      allowedExtensions: ['zip'],
      bytes: Uint8List.fromList(zipBytes),
    );

    return result != null && result.isNotEmpty;
  }
}