// ignore_for_file: directives_ordering
import 'dart:convert';

import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/config_table.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';

import 'user_mapper.dart';

AppThemeEntity mapAppThemeStringToEntity(String theme) {
  switch (theme) {
    case 'light':
      return AppThemeEntity.light;
    case 'dark':
      return AppThemeEntity.dark;
    default:
      return AppThemeEntity.system;
  }
}

String mapAppThemeEntityToString(AppThemeEntity entity) {
  switch (entity) {
    case AppThemeEntity.light:
      return 'light';
    case AppThemeEntity.dark:
      return 'dark';
    case AppThemeEntity.system:
      return 'system';
  }
}

ConfigEntity mapConfigEntryToEntity(ConfigEntry entry) => ConfigEntity(
      hasAcceptedDisclaimer: entry.hasAcceptedDisclaimer,
      hasAcceptedPolicy: entry.hasAcceptedPolicy,
      hasAcceptedSendAnonymousData: entry.hasAcceptedSendAnonymousData,
      appTheme: mapAppThemeStringToEntity(entry.selectedAppTheme),
      usesImperialUnits: entry.usesImperialUnits ?? false,
      userKcalAdjustment: entry.userKcalAdjustment,
      userCarbGoalPct: entry.userCarbGoalPct,
      userProteinGoalPct: entry.userProteinGoalPct,
      userFatGoalPct: entry.userFatGoalPct,
      dailyWaterGoalMl: entry.dailyWaterGoalMl ?? 2000,
      tdeeMethod: mapTDEEMethodStringToEntity(entry.tdeeMethod),
      exerciseCalorieMode:
          mapExerciseCalorieModeStringToEntity(entry.exerciseCalorieMode),
      exerciseCreditPercent: entry.exerciseCreditPercent,
      userAllergens: mapAllergensJsonToSet(entry.allergens),
      bloodGlucoseMinMgDl: entry.bloodGlucoseMinMgDl ?? 70,
      bloodGlucoseMaxMgDl: entry.bloodGlucoseMaxMgDl ?? 180,
      netCarbsEnabled: entry.netCarbsEnabled != 0,
      stepBonusEnabled: entry.stepBonusEnabled != 0,
      stepBonusPercent: entry.stepBonusPercent,
    );

ConfigEntriesCompanion mapConfigEntityToCompanion(ConfigEntity entity) =>
    ConfigEntriesCompanion(
      id: Value(ConfigEntries.defaultId),
      hasAcceptedDisclaimer: Value(entity.hasAcceptedDisclaimer),
      hasAcceptedPolicy: Value(entity.hasAcceptedPolicy),
      hasAcceptedSendAnonymousData: Value(entity.hasAcceptedSendAnonymousData),
      selectedAppTheme: Value(mapAppThemeEntityToString(entity.appTheme)),
      usesImperialUnits: Value(entity.usesImperialUnits),
      userKcalAdjustment: Value(entity.userKcalAdjustment),
      userCarbGoalPct: Value(entity.userCarbGoalPct),
      userProteinGoalPct: Value(entity.userProteinGoalPct),
      userFatGoalPct: Value(entity.userFatGoalPct),
      dailyWaterGoalMl: Value(entity.dailyWaterGoalMl),
      tdeeMethod: Value(mapTDEEMethodEntityToString(entity.tdeeMethod)),
      exerciseCalorieMode: Value(
          mapExerciseCalorieModeEntityToString(entity.exerciseCalorieMode)),
      exerciseCreditPercent: Value(entity.exerciseCreditPercent),
      allergens: Value(mapAllergenSetToJson(entity.userAllergens)),
      bloodGlucoseMinMgDl: Value(entity.bloodGlucoseMinMgDl),
      bloodGlucoseMaxMgDl: Value(entity.bloodGlucoseMaxMgDl),
      netCarbsEnabled: Value(entity.netCarbsEnabled ? 1 : 0),
      stepBonusEnabled: Value(entity.stepBonusEnabled ? 1 : 0),
      stepBonusPercent: Value(entity.stepBonusPercent),
    );

Set<AllergenType> mapAllergensJsonToSet(String allergensJson) {
  if (allergensJson.isEmpty) return {};
  try {
    final decoded = jsonDecode(allergensJson) as List;
    return decoded.map((e) => AllergenType.fromString(e as String)).toSet();
  } catch (_) {
    return {};
  }
}

String mapAllergenSetToJson(Set<AllergenType> allergens) {
  return jsonEncode(allergens.map((e) => e.name).toList());
}