import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/notification_settings_table.dart';

part 'notification_settings_dao.g.dart';

@DriftAccessor(tables: [NotificationSettings])
class NotificationSettingsDao extends DatabaseAccessor<AppDatabase>
    with _$NotificationSettingsDaoMixin {
  NotificationSettingsDao(super.db);

  Future<NotificationSetting?> getSettings(int userId) async {
    return await (select(notificationSettings)
          ..where((t) => t.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future<void> upsertSettings(NotificationSettingsCompanion entry) async {
    await into(notificationSettings).insertOnConflictUpdate(entry);
  }
}
