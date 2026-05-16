import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/domain/repository/intake_repository.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;

class ImportDataUsecase {
  final UserActivityRepository _userActivityRepository;
  final IntakeRepository _intakeRepository;
  final TrackedDayRepository _trackedDayRepository;

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
      if (file.bytes == null) {
        throw Exception('No file data available');
      }
      zipBytes = file.bytes!;
    } else {
      if (file.path == null) {
        throw Exception('No file path available');
      }
      zipBytes = await file_helper.readFileBytes(file.path!);
    }

    final archive = ZipDecoder().decodeBytes(zipBytes);

    final userActivityFile = archive.findFile(userActivityJsonFileName);
    if (userActivityFile != null) {
      final jsonList = (jsonDecode(
                  utf8.decode(userActivityFile.content as List<int>))
              as List)
          .cast<Map<String, dynamic>>();
      await _userActivityRepository.importAllFromJson(jsonList);
    } else {
      throw Exception('User activity file not found in the archive');
    }

    final intakeFile = archive.findFile(userIntakeJsonFileName);
    if (intakeFile != null) {
      final jsonList = (jsonDecode(
                  utf8.decode(intakeFile.content as List<int>))
              as List)
          .cast<Map<String, dynamic>>();
      await _intakeRepository.importAllFromJson(jsonList);
    } else {
      throw Exception('Intake file not found in the archive');
    }

    final trackedDayFile = archive.findFile(trackedDayJsonFileName);
    if (trackedDayFile != null) {
      final jsonList = (jsonDecode(
                  utf8.decode(trackedDayFile.content as List<int>))
              as List)
          .cast<Map<String, dynamic>>();
      await _trackedDayRepository.importAllFromJson(jsonList);
    } else {
      throw Exception('Tracked day file not found in the archive');
    }

    return true;
  }
}