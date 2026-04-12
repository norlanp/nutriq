import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/notification_settings_dao.dart';

class NotificationSettingsDataSource {
  final NotificationSettingsDao _dao;

  NotificationSettingsDataSource(this._dao);

  Future<NotificationSetting?> getSettings(int userId) =>
      _dao.getSettings(userId);

  Future<void> upsertSettings(NotificationSettingsCompanion entry) =>
      _dao.upsertSettings(entry);
}
