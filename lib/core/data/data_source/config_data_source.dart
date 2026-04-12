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
}
