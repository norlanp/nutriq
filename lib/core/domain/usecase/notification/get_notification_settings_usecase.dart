import 'package:nutriq/core/domain/repository/notification_settings_repository.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';

class GetNotificationSettingsUsecase {
  final NotificationSettingsRepository _notificationSettingsRepository;

  GetNotificationSettingsUsecase(this._notificationSettingsRepository);

  Future<NotificationSettingsEntity?> getSettings(int userId) async {
    return await _notificationSettingsRepository.getSettings(userId);
  }
}
