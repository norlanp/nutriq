import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/config_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/config_dao.dart';
import 'package:nutriq/core/data/repository/config_repository.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart' as domain;

void main() {
  late AppDatabase db;
  late domain.ConfigRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    final dao = ConfigDao(db);
    await dao.initializeConfig();
    repo = ConfigRepository(ConfigDataSource(dao));
  });

  tearDown(() async {
    await db.close();
  });

  test('getConfig returns default config after initialization', () async {
    final config = await repo.getConfig();
    expect(config.hasAcceptedDisclaimer, false);
    expect(config.hasAcceptedPolicy, false);
    expect(config.hasAcceptedSendAnonymousData, false);
    expect(config.appTheme, AppThemeEntity.system);
  });

  test('setConfigDisclaimer updates disclaimer', () async {
    await repo.setConfigDisclaimer(true);
    final config = await repo.getConfig();
    expect(config.hasAcceptedDisclaimer, true);
  });

  test('setConfigHasAcceptedAnonymousData updates flag', () async {
    await repo.setConfigHasAcceptedAnonymousData(true);
    final result = await repo.getConfigHasAcceptedAnonymousData();
    expect(result, true);
  });

  test('getConfigAppTheme returns system by default', () async {
    final theme = await repo.getConfigAppTheme();
    expect(theme, AppThemeEntity.system);
  });

  test('setConfigAppTheme persists theme change', () async {
    await repo.setConfigAppTheme(AppThemeEntity.dark);
    final theme = await repo.getConfigAppTheme();
    expect(theme, AppThemeEntity.dark);
  });

  test('setConfigUsesImperialUnits persists value', () async {
    await repo.setConfigUsesImperialUnits(true);
    final config = await repo.getConfig();
    expect(config.usesImperialUnits, true);
  });

  test('getConfigKcalAdjustment returns 0 by default', () async {
    final adjustment = await repo.getConfigKcalAdjustment();
    expect(adjustment, 0);
  });

  test('setConfigKcalAdjustment persists value', () async {
    await repo.setConfigKcalAdjustment(200);
    final adjustment = await repo.getConfigKcalAdjustment();
    expect(adjustment, 200);
  });

  test('updateConfig writes full config', () async {
    final entity = ConfigEntity(
      true,
      true,
      true,
      AppThemeEntity.light,
      usesImperialUnits: true,
    );
    await repo.updateConfig(entity);
    final config = await repo.getConfig();
    expect(config.hasAcceptedDisclaimer, true);
    expect(config.appTheme, AppThemeEntity.light);
  });
}
