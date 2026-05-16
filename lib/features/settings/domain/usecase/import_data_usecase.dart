import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/repository/intake_repository.dart' as data_intake;
import 'package:nutriq/core/data/repository/tracked_day_repository.dart' as data_tracked_day;
import 'package:nutriq/core/data/repository/user_activity_repository.dart' as data_user_activity;
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;

class ImportDataUsecase {
  final data_user_activity.UserActivityRepository _userActivityRepository;
  final data_intake.IntakeRepository _intakeRepository;
  final data_tracked_day.TrackedDayRepository _trackedDayRepository;

  ImportDataUsecase(this._userActivityRepository, this._intakeRepository,
      this._trackedDayRepository);

  Future<bool> importData(String userActivityJsonFileName,
      String userIntakeJsonFileName, String trackedDayJsonFileName) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      withData: kIsWeb,
    );

    if (result == null) {
      throw Exception('No file selected');
    }

    final file = result.files.single;

    List<int> zipBytes;
    if (kIsWeb) {
      // On web, use bytes from the picker directly
      if (file.bytes == null) {
        throw Exception('No file data available');
      }
      zipBytes = file.bytes!;
    } else {
      if (file.path == null) {
        throw Exception('No file path available');
      }
      // On native, read from file path
      zipBytes = await file_helper.readFileBytes(file.path!);
    }

    final archive = ZipDecoder().decodeBytes(zipBytes);

    final userActivityFile = archive.findFile(userActivityJsonFileName);
    if (userActivityFile != null) {
      final userActivityJsonString =
          utf8.decode(userActivityFile.content as List<int>);
      final userActivityList = (jsonDecode(userActivityJsonString) as List)
          .cast<Map<String, dynamic>>();

      final companions = userActivityList
          .map((json) => UserActivity.fromJson(json).toCompanion(false))
          .toList();

      await _userActivityRepository.addAllUserActivitiesData(companions);
    } else {
      throw Exception('User activity file not found in the archive');
    }

    final intakeFile = archive.findFile(userIntakeJsonFileName);
    if (intakeFile != null) {
      final intakeJsonString = utf8.decode(intakeFile.content as List<int>);
      final intakeList =
          (jsonDecode(intakeJsonString) as List).cast<Map<String, dynamic>>();

      final companions = intakeList
          .map((json) => Intake.fromJson(json).toCompanion(false))
          .toList();

      await _intakeRepository.addAllIntakesData(companions);
    } else {
      throw Exception('Intake file not found in the archive');
    }

    final trackedDayFile = archive.findFile(trackedDayJsonFileName);
    if (trackedDayFile != null) {
      final trackedDayJsonString =
          utf8.decode(trackedDayFile.content as List<int>);
      final trackedDayList = (jsonDecode(trackedDayJsonString) as List)
          .cast<Map<String, dynamic>>();

      final companions = trackedDayList
          .map((json) => TrackedDay.fromJson(json).toCompanion(false))
          .toList();

      await _trackedDayRepository.addAllTrackedDaysData(companions);
    } else {
      throw Exception('Tracked day file not found in the archive');
    }

    return true;
  }
}
