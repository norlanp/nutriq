import 'package:nutriq/core/domain/repository/notification_settings_repository.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';

class SaveNotificationSettingsUsecase {
  final NotificationSettingsRepository _notificationSettingsRepository;

  SaveNotificationSettingsUsecase(this._notificationSettingsRepository);

  Future<void> saveSettings(NotificationSettingsEntity settings) async {
    return await _notificationSettingsRepository.saveSettings(settings);
  }
}
