import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/config_table.dart';

part 'config_dao.g.dart';

@DriftAccessor(tables: [ConfigEntries])
class ConfigDao extends DatabaseAccessor<AppDatabase> with _$ConfigDaoMixin {
  ConfigDao(super.db);

  static const _configId = ConfigEntries.defaultId;

  Future<ConfigEntry> getConfig() async {
    final config = await (select(
      configEntries,
    )..where((t) => t.id.equals(_configId)))
        .getSingleOrNull();
    if (config != null) return config;
    await initializeConfig();
    return await (select(
      configEntries,
    )..where((t) => t.id.equals(_configId)))
        .getSingle();
  }

  Future<bool> configInitialized() async {
    final config = await (select(
      configEntries,
    )..where((t) => t.id.equals(_configId)))
        .getSingleOrNull();
    return config != null;
  }

  Future<void> initializeConfig() async {
    await into(configEntries).insert(
      ConfigEntriesCompanion.insert(
        hasAcceptedDisclaimer: Value(false),
        hasAcceptedPolicy: Value(false),
        hasAcceptedSendAnonymousData: Value(false),
        selectedAppTheme: Value('system'),
      ),
    );
  }

  Future<void> setDisclaimer(bool value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(hasAcceptedDisclaimer: Value(value)),
    );
  }

  Future<void> setAcceptedAnonymousData(bool value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(hasAcceptedSendAnonymousData: Value(value)),
    );
  }

  Future<String> getAppTheme() async {
    final config = await getConfig();
    return config.selectedAppTheme;
  }

  Future<void> setAppTheme(String theme) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(selectedAppTheme: Value(theme)),
    );
  }

  Future<void> setUsesImperialUnits(bool value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(usesImperialUnits: Value(value)),
    );
  }

  Future<double> getKcalAdjustment() async {
    final config = await getConfig();
    return config.userKcalAdjustment ?? 0;
  }

  Future<void> setKcalAdjustment(double value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(userKcalAdjustment: Value(value)),
    );
  }

  Future<void> setCarbGoalPct(double value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(userCarbGoalPct: Value(value)),
    );
  }

  Future<void> setProteinGoalPct(double value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(userProteinGoalPct: Value(value)),
    );
  }

  Future<void> setFatGoalPct(double value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(userFatGoalPct: Value(value)),
    );
  }

  Future<int> getDailyWaterGoalMl() async {
    final config = await getConfig();
    return config.dailyWaterGoalMl ?? 2000;
  }

  Future<void> setDailyWaterGoalMl(int value) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(dailyWaterGoalMl: Value(value)),
    );
  }

  Future<void> addConfig(ConfigEntriesCompanion config) async {
    await into(configEntries).insertOnConflictUpdate(config);
  }

  Future<String> getTDEEMethod() async {
    final config = await getConfig();
    return config.tdeeMethod;
  }

  Future<void> setTDEEMethod(String method) async {
    await (update(configEntries)..where((t) => t.id.equals(_configId))).write(
      ConfigEntriesCompanion(tdeeMethod: Value(method)),
    );
  }
}
