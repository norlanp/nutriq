import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/config_dao.dart';

class ConfigDataSource {
  final ConfigDao _dao;

  ConfigDataSource(this._dao);

  Future<bool> configInitialized() => _dao.configInitialized();

  Future<void> initializeConfig() => _dao.initializeConfig();

  Future<ConfigEntry> getConfig() => _dao.getConfig();

  Future<void> setDisclaimer(bool value) => _dao.setDisclaimer(value);

  Future<void> setAcceptedAnonymousData(bool value) =>
      _dao.setAcceptedAnonymousData(value);

  Future<bool> getHasAcceptedAnonymousData() async {
    final config = await _dao.getConfig();
    return config.hasAcceptedSendAnonymousData;
  }

  Future<String> getAppTheme() => _dao.getAppTheme();

  Future<void> setAppTheme(String theme) => _dao.setAppTheme(theme);

  Future<void> setUsesImperialUnits(bool value) =>
      _dao.setUsesImperialUnits(value);

  Future<double> getKcalAdjustment() => _dao.getKcalAdjustment();

  Future<void> setKcalAdjustment(double value) => _dao.setKcalAdjustment(value);

  Future<void> setCarbGoalPct(double value) => _dao.setCarbGoalPct(value);

  Future<void> setProteinGoalPct(double value) => _dao.setProteinGoalPct(value);

  Future<void> setFatGoalPct(double value) => _dao.setFatGoalPct(value);

  Future<void> addConfig(ConfigEntriesCompanion config) =>
      _dao.addConfig(config);

  Future<String> getTDEEMethod() => _dao.getTDEEMethod();

  Future<void> setTDEEMethod(String method) => _dao.setTDEEMethod(method);

  Future<String?> getCalorieCycleJson() => _dao.getCalorieCycleJson();

  Future<void> setCalorieCycleJson(String json) =>
      _dao.setCalorieCycleJson(json);

  Future<bool> getCalorieCyclingEnabled() => _dao.getCalorieCyclingEnabled();

  Future<void> setCalorieCyclingEnabled(bool enabled) =>
      _dao.setCalorieCyclingEnabled(enabled);

  Future<String> getExerciseCalorieMode() => _dao.getExerciseCalorieMode();

  Future<void> setExerciseCalorieMode(String mode) =>
      _dao.setExerciseCalorieMode(mode);

  Future<double> getExerciseCreditPercent() => _dao.getExerciseCreditPercent();

  Future<void> setExerciseCreditPercent(double percent) =>
      _dao.setExerciseCreditPercent(percent);

  Future<String> getAllergens() => _dao.getAllergens();

  Future<void> setAllergens(String allergensJson) =>
      _dao.setAllergens(allergensJson);

  Future<bool> getNetCarbsEnabled() => _dao.getNetCarbsEnabled();

  Future<void> setNetCarbsEnabled(bool enabled) =>
      _dao.setNetCarbsEnabled(enabled);

  Future<bool> getStepBonusEnabled() => _dao.getStepBonusEnabled();

  Future<void> setStepBonusEnabled(bool enabled) =>
      _dao.setStepBonusEnabled(enabled);

  Future<double> getStepBonusPercent() => _dao.getStepBonusPercent();

  Future<void> setStepBonusPercent(double percent) =>
      _dao.setStepBonusPercent(percent);
}
