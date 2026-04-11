import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:file_picker/file_picker.dart';
import 'package:nutriq/core/data/repository/intake_repository.dart';
import 'package:nutriq/core/data/repository/tracked_day_repository.dart';
import 'package:nutriq/core/data/repository/user_activity_repository.dart';

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
    final fullUserActivity =
        await _userActivityRepository.getAllUserActivitiesData();
    final fullUserActivityJson = jsonEncode(
        fullUserActivity.map((activity) => activity.toJson()).toList());
    final userActivityJsonBytes = utf8.encode(fullUserActivityJson);

    final fullIntake = await _intakeRepository.getAllIntakesData();
    final fullIntakeJson =
        jsonEncode(fullIntake.map((intake) => intake.toJson()).toList());
    final intakeJsonBytes = utf8.encode(fullIntakeJson);

    final fullTrackedDay = await _trackedDayRepository.getAllTrackedDaysData();
    final fullTrackedDayJson = jsonEncode(
        fullTrackedDay.map((trackedDay) => trackedDay.toJson()).toList());
    final trackedDayJsonBytes = utf8.encode(fullTrackedDayJson);

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
