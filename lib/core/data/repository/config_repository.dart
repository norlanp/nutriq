import 'package:nutriq/core/data/data_source/config_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart' as domain;

class ConfigRepository implements domain.ConfigRepository {
  final ConfigDataSource _configDataSource;

  ConfigRepository(this._configDataSource);

  @override
  Future<void> updateConfig(ConfigEntity configEntity) async {
    final companion = mapConfigEntityToCompanion(configEntity);
    await _configDataSource.addConfig(companion);
  }

  @override
  Future<void> setConfigDisclaimer(bool hasAcceptedDisclaimer) async {
    await _configDataSource.setDisclaimer(hasAcceptedDisclaimer);
  }

  @override
  Future<void> setConfigHasAcceptedAnonymousData(
    bool hasAcceptedAnonymousData,
  ) async {
    await _configDataSource.setAcceptedAnonymousData(hasAcceptedAnonymousData);
  }

  @override
  Future<bool> getConfigHasAcceptedAnonymousData() async {
    return await _configDataSource.getHasAcceptedAnonymousData();
  }

  @override
  Future<AppThemeEntity> getConfigAppTheme() async {
    final themeString = await _configDataSource.getAppTheme();
    return mapAppThemeStringToEntity(themeString);
  }

  @override
  Future<void> setConfigAppTheme(AppThemeEntity appTheme) async {
    await _configDataSource.setAppTheme(mapAppThemeEntityToString(appTheme));
  }

  @override
  Future<ConfigEntity> getConfig() async {
    final configEntry = await _configDataSource.getConfig();
    return mapConfigEntryToEntity(configEntry);
  }

  Future<ConfigEntry> getConfigEntry() async {
    return await _configDataSource.getConfig();
  }

  @override
  Future<void> setConfigUsesImperialUnits(bool usesImperialUnits) async {
    await _configDataSource.setUsesImperialUnits(usesImperialUnits);
  }

  @override
  Future<double> getConfigKcalAdjustment() async {
    return await _configDataSource.getKcalAdjustment();
  }

  @override
  Future<void> setConfigKcalAdjustment(double kcalAdjustment) async {
    await _configDataSource.setKcalAdjustment(kcalAdjustment);
  }

  @override
  Future<void> setUserMacroPct(double carbs, double protein, double fat) async {
    await _configDataSource.setCarbGoalPct(carbs);
    await _configDataSource.setProteinGoalPct(protein);
    await _configDataSource.setFatGoalPct(fat);
  }

  @override
  Future<TDEEMethodEntity> getConfigTDEEMethod() async {
    final methodString = await _configDataSource.getTDEEMethod();
    return mapTDEEMethodStringToEntity(methodString);
  }

  @override
  Future<void> setConfigTDEEMethod(TDEEMethodEntity method) async {
    await _configDataSource.setTDEEMethod(mapTDEEMethodEntityToString(method));
  }

  @override
  Future<CalorieCycleEntity> getCalorieCycle() async {
    final json = await _configDataSource.getCalorieCycleJson();
    final enabled = await _configDataSource.getCalorieCyclingEnabled();
    return mapCalorieCycleJsonToEntity(json, enabled);
  }

  @override
  Future<void> saveCalorieCycle(CalorieCycleEntity entity) async {
    await _configDataSource.setCalorieCycleJson(
      mapCalorieCycleEntityToJson(entity),
    );
    await _configDataSource.setCalorieCyclingEnabled(entity.isEnabled);
  }

  @override
  Future<ExerciseCalorieModeEntity> getConfigExerciseCalorieMode() async {
    final modeString = await _configDataSource.getExerciseCalorieMode();
    return mapExerciseCalorieModeStringToEntity(modeString);
  }

  @override
  Future<void> setConfigExerciseCalorieMode(
      ExerciseCalorieModeEntity mode) async {
    await _configDataSource.setExerciseCalorieMode(
      mapExerciseCalorieModeEntityToString(mode),
    );
  }

  @override
  Future<double> getConfigExerciseCreditPercent() async {
    return await _configDataSource.getExerciseCreditPercent();
  }

  @override
  Future<void> setConfigExerciseCreditPercent(double percent) async {
    await _configDataSource.setExerciseCreditPercent(percent);
  }

  @override
  Future<Set<AllergenType>> getConfigAllergens() async {
    final allergensJson = await _configDataSource.getAllergens();
    return mapAllergensJsonToSet(allergensJson);
  }

  @override
  Future<void> setConfigAllergens(Set<AllergenType> allergens) async {
    await _configDataSource.setAllergens(mapAllergenSetToJson(allergens));
  }

  @override
  Future<bool> getNetCarbsEnabled() async {
    return await _configDataSource.getNetCarbsEnabled();
  }

  @override
  Future<void> setNetCarbsEnabled(bool enabled) async {
    await _configDataSource.setNetCarbsEnabled(enabled);
  }

  @override
  Future<bool> getStepBonusEnabled() async {
    return await _configDataSource.getStepBonusEnabled();
  }

  @override
  Future<void> setStepBonusEnabled(bool enabled) async {
    await _configDataSource.setStepBonusEnabled(enabled);
  }

  @override
  Future<double> getStepBonusPercent() async {
    return await _configDataSource.getStepBonusPercent();
  }

  @override
  Future<void> setStepBonusPercent(double percent) async {
    await _configDataSource.setStepBonusPercent(percent);
  }
}
