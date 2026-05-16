import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/notification/get_notification_settings_usecase.dart';
import 'package:nutriq/core/domain/usecase/notification/save_notification_settings_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getNotificationSettingsUsecaseProvider = Provider((ref) {
  return GetNotificationSettingsUsecase(
      ref.watch(notificationSettingsRepositoryProvider));
});

final saveNotificationSettingsUsecaseProvider = Provider((ref) {
  return SaveNotificationSettingsUsecase(
      ref.watch(notificationSettingsRepositoryProvider));
});