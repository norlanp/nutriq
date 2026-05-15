import 'package:nutriq/core/data/repository/config_repository.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';

class AddConfigUsecase {
  final ConfigRepository _configRepository;

  AddConfigUsecase(this._configRepository);

  Future<void> addConfig(ConfigEntity configEntity) async {
    _configRepository.updateConfig(configEntity);
  }

  Future<void> setConfigDisclaimer(bool hasAcceptedDisclaimer) async {
    _configRepository.setConfigDisclaimer(hasAcceptedDisclaimer);
  }

  Future<void> setConfigHasAcceptedAnonymousData(
      bool hasAcceptedAnonymousData) async {
    _configRepository
        .setConfigHasAcceptedAnonymousData(hasAcceptedAnonymousData);
  }

  Future<void> setConfigAppTheme(AppThemeEntity appTheme) async {
    await _configRepository.setConfigAppTheme(appTheme);
  }

  Future<void> setConfigUsesImperialUnits(bool usesImperialUnits) async {
    _configRepository.setConfigUsesImperialUnits(usesImperialUnits);
  }

  Future<void> setConfigKcalAdjustment(double kcalAdjustment) async {
    _configRepository.setConfigKcalAdjustment(kcalAdjustment);
  }

  Future<void> setConfigMacroGoalPct(
      double carbGoalPct, double proteinGoalPct, double fatPctGoal) async {
    _configRepository.setUserMacroPct(carbGoalPct, proteinGoalPct, fatPctGoal);
  }

  Future<void> setConfigTDEEMethod(TDEEMethodEntity method) async {
    await _configRepository.setConfigTDEEMethod(method);
  }

  Future<TDEEMethodEntity> getConfigTDEEMethod() async {
    return await _configRepository.getConfigTDEEMethod();
  }

  Future<void> setConfigExerciseCalorieMode(
      ExerciseCalorieModeEntity mode) async {
    await _configRepository.setConfigExerciseCalorieMode(mode);
  }

  Future<void> setConfigExerciseCreditPercent(double percent) async {
    await _configRepository.setConfigExerciseCreditPercent(percent);
  }

  Future<void> setConfigAllergens(Set<AllergenType> allergens) async {
    await _configRepository.setConfigAllergens(allergens);
  }

  Future<Set<AllergenType>> getConfigAllergens() async {
    return await _configRepository.getConfigAllergens();
  }

  Future<bool> getNetCarbsEnabled() async {
    return await _configRepository.getNetCarbsEnabled();
  }

  Future<void> setNetCarbsEnabled(bool enabled) async {
    await _configRepository.setNetCarbsEnabled(enabled);
  }

  Future<bool> getStepBonusEnabled() async {
    return await _configRepository.getStepBonusEnabled();
  }

  Future<void> setStepBonusEnabled(bool enabled) async {
    await _configRepository.setStepBonusEnabled(enabled);
  }

  Future<double> getStepBonusPercent() async {
    return await _configRepository.getStepBonusPercent();
  }

  Future<void> setStepBonusPercent(double percent) async {
    await _configRepository.setStepBonusPercent(percent);
  }
}
