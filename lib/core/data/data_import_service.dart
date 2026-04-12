import 'dart:convert';

import 'package:archive/archive.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/utils/file_helper_stub.dart'
    if (dart.library.html) 'package:nutriq/core/utils/file_helper_web.dart'
    as file_helper;

enum ImportResult { success, error, cancelled }

class DataImportService {
  final AppDatabase _db;

  DataImportService(this._db);

  Future<ImportResult> importFromJsonFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: kIsWeb,
    );

    if (result == null || result.files.isEmpty) return ImportResult.cancelled;
    final file = result.files.single;

    try {
      String jsonString;
      if (kIsWeb) {
        if (file.bytes == null) return ImportResult.error;
        jsonString = utf8.decode(file.bytes!);
      } else {
        if (file.path == null) return ImportResult.error;
        final bytes = await file_helper.readFileBytes(file.path!);
        jsonString = utf8.decode(bytes);
      }
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      await importDataFromMap(data);
      return ImportResult.success;
    } catch (e) {
      return ImportResult.error;
    }
  }

  Future<ImportResult> importFromZipFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
      withData: kIsWeb,
    );

    if (result == null || result.files.isEmpty) return ImportResult.cancelled;
    final file = result.files.single;

    try {
      List<int> zipBytes;
      if (kIsWeb) {
        if (file.bytes == null) return ImportResult.error;
        zipBytes = file.bytes!;
      } else {
        if (file.path == null) return ImportResult.error;
        zipBytes = await file_helper.readFileBytes(file.path!);
      }
      final archive = ZipDecoder().decodeBytes(zipBytes);
      final data = <String, dynamic>{};

      for (final file in archive) {
        if (file.isFile) {
          final content = utf8.decode(file.content as List<int>);
          final key = file.name.replaceAll('.json', '');
          data[key] = jsonDecode(content);
        }
      }

      await importDataFromMap(data);
      return ImportResult.success;
    } catch (e) {
      return ImportResult.error;
    }
  }

  Future<Map<String, dynamic>?> previewFromJsonFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: kIsWeb,
    );

    if (result == null || result.files.isEmpty) return null;
    final file = result.files.single;

    try {
      String jsonString;
      if (kIsWeb) {
        if (file.bytes == null) return null;
        jsonString = utf8.decode(file.bytes!);
      } else {
        if (file.path == null) return null;
        final bytes = await file_helper.readFileBytes(file.path!);
        jsonString = utf8.decode(bytes);
      }
      return jsonDecode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>?> previewFromZipFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
      withData: kIsWeb,
    );

    if (result == null || result.files.isEmpty) return null;
    final file = result.files.single;

    try {
      List<int> zipBytes;
      if (kIsWeb) {
        if (file.bytes == null) return null;
        zipBytes = file.bytes!;
      } else {
        if (file.path == null) return null;
        zipBytes = await file_helper.readFileBytes(file.path!);
      }
      final archive = ZipDecoder().decodeBytes(zipBytes);
      final data = <String, dynamic>{};

      for (final file in archive) {
        if (file.isFile) {
          final content = utf8.decode(file.content as List<int>);
          final key = file.name.replaceAll('.json', '');
          data[key] = jsonDecode(content);
        }
      }

      return data;
    } catch (e) {
      return null;
    }
  }

  int countRecords(Map<String, dynamic> data, String key) {
    final value = data[key];
    if (value is List) return value.length;
    return 0;
  }

  // ignore: unused_element
  Future<void> importDataFromMap(Map<String, dynamic> data) async {
    await _db.transaction(() async {
      if (data.containsKey('meals')) {
        final meals = (data['meals'] as List)
            .map((m) =>
                Meal.fromJson(m as Map<String, dynamic>).toCompanion(false))
            .toList();
        for (final meal in meals) {
          await _db.mealDao.addMeal(meal);
        }
      }

      if (data.containsKey('intakes')) {
        final intakes = (data['intakes'] as List)
            .map((i) =>
                Intake.fromJson(i as Map<String, dynamic>).toCompanion(false))
            .toList();
        await _db.intakeDao.addAllIntakes(intakes);
      }

      if (data.containsKey('userActivities')) {
        final activities = (data['userActivities'] as List)
            .map((a) => UserActivity.fromJson(a as Map<String, dynamic>)
                .toCompanion(false))
            .toList();
        for (final activity in activities) {
          await _db.userActivityDao.addUserActivity(activity);
        }
      }

      if (data.containsKey('trackedDays')) {
        final days = (data['trackedDays'] as List)
            .map((d) => TrackedDay.fromJson(d as Map<String, dynamic>)
                .toCompanion(false))
            .toList();
        await _db.trackedDayDao.saveAllTrackedDays(days);
      }

      if (data.containsKey('recipes')) {
        final recipes = (data['recipes'] as List)
            .map((r) =>
                Recipe.fromJson(r as Map<String, dynamic>).toCompanion(false))
            .toList();
        for (final recipe in recipes) {
          await _db.recipeDao.addRecipe(recipe);
        }
      }

      if (data.containsKey('recipeItems')) {
        final items = (data['recipeItems'] as List)
            .map((i) => RecipeItem.fromJson(i as Map<String, dynamic>)
                .toCompanion(false))
            .toList();
        await _db.recipeDao.addRecipeItems(items);
      }

      if (data.containsKey('weights')) {
        final weights = (data['weights'] as List)
            .map((w) =>
                Weight.fromJson(w as Map<String, dynamic>).toCompanion(false))
            .toList();
        for (final weight in weights) {
          await _db.weightDao.insertWeight(weight);
        }
      }

      if (data.containsKey('waterEntries')) {
        final entries = (data['waterEntries'] as List)
            .map((e) => WaterEntry.fromJson(e as Map<String, dynamic>)
                .toCompanion(false))
            .toList();
        for (final entry in entries) {
          await _db.waterDao.insertEntry(entry);
        }
      }

      if (data.containsKey('fasts')) {
        final fasts = (data['fasts'] as List)
            .map((f) =>
                Fast.fromJson(f as Map<String, dynamic>).toCompanion(false))
            .toList();
        for (final fast in fasts) {
          await _db.into(_db.fasts).insertOnConflictUpdate(fast);
        }
      }

      if (data.containsKey('notificationSettings')) {
        final settings = (data['notificationSettings'] as List)
            .map((s) => NotificationSetting.fromJson(s as Map<String, dynamic>)
                .toCompanion(false))
            .toList();
        for (final setting in settings) {
          await _db.notificationSettingsDao.upsertSettings(setting);
        }
      }

      if (data.containsKey('mealPlans')) {
        final plans = (data['mealPlans'] as List)
            .map((p) =>
                MealPlan.fromJson(p as Map<String, dynamic>).toCompanion(false))
            .toList();
        for (final plan in plans) {
          await _db.mealPlanDao.addPlan(plan);
        }
      }

      if (data.containsKey('config')) {
        final configs = (data['config'] as List)
            .map((c) => ConfigEntry.fromJson(c as Map<String, dynamic>)
                .toCompanion(false))
            .toList();
        for (final config in configs) {
          await _db.configDao.addConfig(config);
        }
      }

      if (data.containsKey('users')) {
        final users = (data['users'] as List)
            .map((u) =>
                User.fromJson(u as Map<String, dynamic>).toCompanion(false))
            .toList();
        for (final user in users) {
          await _db.userDao.saveUser(user);
        }
      }
    });
  }
}
