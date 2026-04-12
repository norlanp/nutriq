import 'package:nutriq/core/data/data_source/notification_settings_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';
import 'package:nutriq/core/domain/repository/notification_settings_repository.dart'
    as domain;

class NotificationSettingsRepository
    implements domain.NotificationSettingsRepository {
  final NotificationSettingsDataSource _notificationSettingsDataSource;

  NotificationSettingsRepository(this._notificationSettingsDataSource);

  @override
  Future<NotificationSettingsEntity?> getSettings(int userId) async {
    final data = await _notificationSettingsDataSource.getSettings(userId);
    return data == null ? null : mapNotificationSettingsToEntity(data);
  }

  @override
  Future<void> saveSettings(NotificationSettingsEntity settings) async {
    final companion = mapNotificationSettingsEntityToCompanion(settings);
    await _notificationSettingsDataSource.upsertSettings(companion);
  }
}
