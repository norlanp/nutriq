import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';

abstract class ConfigRepository {
  Future<void> updateConfig(ConfigEntity configEntity);

  Future<void> setConfigDisclaimer(bool hasAcceptedDisclaimer);

  Future<void> setConfigHasAcceptedAnonymousData(bool hasAcceptedAnonymousData);

  Future<bool> getConfigHasAcceptedAnonymousData();

  Future<AppThemeEntity> getConfigAppTheme();

  Future<void> setConfigAppTheme(AppThemeEntity appTheme);

  Future<ConfigEntity> getConfig();

  Future<void> setConfigUsesImperialUnits(bool usesImperialUnits);

  Future<double> getConfigKcalAdjustment();

  Future<void> setConfigKcalAdjustment(double kcalAdjustment);

  Future<void> setUserMacroPct(double carbs, double protein, double fat);

  Future<TDEEMethodEntity> getConfigTDEEMethod();

  Future<void> setConfigTDEEMethod(TDEEMethodEntity method);

  Future<CalorieCycleEntity> getCalorieCycle();

  Future<void> saveCalorieCycle(CalorieCycleEntity entity);

  Future<ExerciseCalorieModeEntity> getConfigExerciseCalorieMode();

  Future<void> setConfigExerciseCalorieMode(ExerciseCalorieModeEntity mode);

  Future<double> getConfigExerciseCreditPercent();

  Future<void> setConfigExerciseCreditPercent(double percent);

  Future<Set<AllergenType>> getConfigAllergens();

  Future<void> setConfigAllergens(Set<AllergenType> allergens);

  Future<bool> getNetCarbsEnabled();

  Future<void> setNetCarbsEnabled(bool enabled);

  Future<bool> getStepBonusEnabled();

  Future<void> setStepBonusEnabled(bool enabled);

  Future<double> getStepBonusPercent();

  Future<void> setStepBonusPercent(double percent);
}
