import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';

class ConfigEntity extends Equatable {
  final bool hasAcceptedDisclaimer;
  final bool hasAcceptedPolicy;
  final bool hasAcceptedSendAnonymousData;
  final AppThemeEntity appTheme;
  final bool usesImperialUnits;
  final double? userKcalAdjustment;
  final double? userCarbGoalPct;
  final double? userProteinGoalPct;
  final double? userFatGoalPct;
  final int? dailyWaterGoalMl;
  final TDEEMethodEntity tdeeMethod;
  final ExerciseCalorieModeEntity exerciseCalorieMode;
  final double exerciseCreditPercent;
  final Set<AllergenType> userAllergens;
  final int? bloodGlucoseMinMgDl;
  final int? bloodGlucoseMaxMgDl;

  const ConfigEntity(
    this.hasAcceptedDisclaimer,
    this.hasAcceptedPolicy,
    this.hasAcceptedSendAnonymousData,
    this.appTheme, {
    this.usesImperialUnits = false,
    this.userKcalAdjustment,
    this.userCarbGoalPct,
    this.userProteinGoalPct,
    this.userFatGoalPct,
    this.dailyWaterGoalMl = 2000,
    this.tdeeMethod = TDEEMethodEntity.iom2005,
    this.exerciseCalorieMode = ExerciseCalorieModeEntity.half,
    this.exerciseCreditPercent = 0.5,
    this.userAllergens = const {},
    this.bloodGlucoseMinMgDl = 70,
    this.bloodGlucoseMaxMgDl = 180,
  });

  @override
  List<Object?> get props => [
        hasAcceptedDisclaimer,
        hasAcceptedPolicy,
        hasAcceptedSendAnonymousData,
        usesImperialUnits,
        userKcalAdjustment,
        userCarbGoalPct,
        userProteinGoalPct,
        userFatGoalPct,
        dailyWaterGoalMl,
        tdeeMethod,
        exerciseCalorieMode,
        exerciseCreditPercent,
        userAllergens,
        bloodGlucoseMinMgDl,
        bloodGlucoseMaxMgDl,
      ];
}
