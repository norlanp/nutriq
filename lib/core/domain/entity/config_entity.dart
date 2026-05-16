import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';

part 'config_entity.freezed.dart';

@freezed
class ConfigEntity with _$ConfigEntity {
  const ConfigEntity._();

  const factory ConfigEntity({
    required bool hasAcceptedDisclaimer,
    required bool hasAcceptedPolicy,
    required bool hasAcceptedSendAnonymousData,
    required AppThemeEntity appTheme,
    @Default(false) bool usesImperialUnits,
    double? userKcalAdjustment,
    double? userCarbGoalPct,
    double? userProteinGoalPct,
    double? userFatGoalPct,
    @Default(2000) int? dailyWaterGoalMl,
    @Default(TDEEMethodEntity.iom2005) TDEEMethodEntity tdeeMethod,
    @Default(ExerciseCalorieModeEntity.half)
    ExerciseCalorieModeEntity exerciseCalorieMode,
    @Default(0.5) double exerciseCreditPercent,
    @Default(const <AllergenType>{}) Set<AllergenType> userAllergens,
    @Default(70) int? bloodGlucoseMinMgDl,
    @Default(180) int? bloodGlucoseMaxMgDl,
    @Default(false) bool netCarbsEnabled,
    @Default(false) bool stepBonusEnabled,
    @Default(0.5) double stepBonusPercent,
  }) = _ConfigEntity;
}