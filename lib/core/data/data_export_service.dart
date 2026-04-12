import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

enum ExportFormat { json, csv }

enum DataType {
  config,
  users,
  intakes,
  meals,
  userActivities,
  trackedDays,
  recipes,
  weights,
  notificationSettings,
  waterEntries,
  fasts,
  mealPlans,
}

class DataExportService {
  final AppDatabase _db;

  DataExportService(this._db);

  Future<String> exportData(
    Set<DataType> dataTypes,
    ExportFormat format,
  ) async {
    final Map<String, dynamic> allData = {};

    if (dataTypes.contains(DataType.config)) {
      final rows = await _db.configDao.getConfig();
      allData['config'] = [rows.toJson()];
    }
    if (dataTypes.contains(DataType.users)) {
      final hasUser = await _db.userDao.hasUser();
      if (hasUser) {
        final rows = await _db.userDao.getUser();
        allData['users'] = [rows.toJson()];
      }
    }
    if (dataTypes.contains(DataType.intakes)) {
      final rows = await _db.intakeDao.getAllIntakes();
      allData['intakes'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.meals)) {
      final rows = await _db.mealDao.getAllMeals();
      allData['meals'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.userActivities)) {
      final rows = await _db.userActivityDao.getAllUserActivities();
      allData['userActivities'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.trackedDays)) {
      final rows = await _db.trackedDayDao.getAllTrackedDays();
      allData['trackedDays'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.recipes)) {
      final recipeRows = await _db.recipeDao.getAllRecipes();
      allData['recipes'] = recipeRows.map((r) => r.toJson()).toList();

      final allItems = <Map<String, dynamic>>[];
      for (final recipe in recipeRows) {
        final items = await _db.recipeDao.getRecipeItems(recipe.id);
        allItems.addAll(items.map((i) => i.toJson()).toList());
      }
      allData['recipeItems'] = allItems;
    }
    if (dataTypes.contains(DataType.weights)) {
      final rows = await _db.weightDao.getAllWeights();
      allData['weights'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.notificationSettings)) {
      final setting = await _db.notificationSettingsDao.getSettings(0);
      if (setting != null) {
        allData['notificationSettings'] = [setting.toJson()];
      } else {
        allData['notificationSettings'] = [];
      }
    }
    if (dataTypes.contains(DataType.waterEntries)) {
      final rows = await (_db.select(_db.waterEntries)).get();
      allData['waterEntries'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.fasts)) {
      final rows = await (_db.select(_db.fasts)).get();
      allData['fasts'] = rows.map((r) => r.toJson()).toList();
    }
    if (dataTypes.contains(DataType.mealPlans)) {
      final rows = await (_db.select(_db.mealPlans)).get();
      allData['mealPlans'] = rows.map((r) => r.toJson()).toList();
    }

    final timestamp = DateTime.now().millisecondsSinceEpoch;

    if (format == ExportFormat.json) {
      final jsonString = const JsonEncoder.withIndent('  ').convert(allData);
      if (kIsWeb || !file_helper.hasFileSupport) {
        // On web, return a data URI or handle differently
        throw UnsupportedError(
            'File export not supported on web — use share instead');
      }
      final dir = await getTemporaryDirectory();
      final filePath = p.join(dir.path, 'nutriq_export_$timestamp.json');
      await file_helper.writeTempFile('nutriq_export_$timestamp.json',
          Uint8List.fromList(utf8.encode(jsonString)));
      return filePath;
    }

    final archive = Archive();
    for (final entry in allData.entries) {
      final jsonString =
          const JsonEncoder.withIndent('  ').convert(entry.value);
      final bytes = utf8.encode(jsonString);
      archive.addFile(ArchiveFile('${entry.key}.json', bytes.length, bytes));
    }

    final zipBytes = Uint8List.fromList(ZipEncoder().encode(archive));

    if (kIsWeb || !file_helper.hasFileSupport) {
      throw UnsupportedError(
          'File export not supported on web — use share instead');
    }

    final dir = await getTemporaryDirectory();
    final filePath = p.join(dir.path, 'nutriq_export_$timestamp.zip');
    await file_helper.writeTempFile('nutriq_export_$timestamp.zip', zipBytes);
    return filePath;
  }
}
