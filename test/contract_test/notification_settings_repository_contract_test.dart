import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/notification_settings_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/notification_settings_dao.dart';
import 'package:nutriq/core/data/repository/notification_settings_repository.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';

void main() {
  late AppDatabase db;
  late NotificationSettingsRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = NotificationSettingsRepository(
      NotificationSettingsDataSource(NotificationSettingsDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('getSettings returns null initially', () async {
    final settings = await repo.getSettings(1);
    expect(settings, isNull);
  });

  test('saveSettings persists and getSettings retrieves', () async {
    final entity = NotificationSettingsEntity(
      id: 1,
      userId: 1,
      mealReminderMinutes: {IntakeTypeEntity.lunch: 30},
      dailySummaryEnabled: true,
      dailySummaryMinutes: 60,
    );
    await repo.saveSettings(entity);
    final settings = await repo.getSettings(1);
    expect(settings, isNotNull);
    expect(settings!.dailySummaryEnabled, true);
    expect(settings.dailySummaryMinutes, 60);
  });
}