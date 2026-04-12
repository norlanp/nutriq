import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';

abstract class NotificationSettingsRepository {
  Future<NotificationSettingsEntity?> getSettings(int userId);

  Future<void> saveSettings(NotificationSettingsEntity settings);
}
