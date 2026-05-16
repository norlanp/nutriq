import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/notifications/presentation/notifier/notification_settings_state.dart';

class NotificationSettingsNotifier extends Notifier<NotificationSettingsState> {
  @override
  NotificationSettingsState build() => const NotificationSettingsState();

  Future<void> loadSettings(int userId) async {
    state = const NotificationSettingsState(isLoading: true);
    try {
      final settings =
          await ref.read(getNotificationSettingsUsecaseProvider).getSettings(userId);
      if (settings != null) {
        state = NotificationSettingsState(settings: settings);
      } else {
        state = const NotificationSettingsState(errorMessage: 'Settings not found');
      }
    } catch (e) {
      state = NotificationSettingsState(errorMessage: e.toString());
    }
  }

  Future<void> saveSettings(NotificationSettingsEntity settings) async {
    state = const NotificationSettingsState(isLoading: true);
    try {
      await ref.read(saveNotificationSettingsUsecaseProvider).saveSettings(settings);
      state = NotificationSettingsState(settings: settings);
    } catch (e) {
      state = NotificationSettingsState(errorMessage: e.toString());
    }
  }

  Future<void> toggleDailySummary(int userId, bool enabled) async {
    try {
      final currentSettings =
          await ref.read(getNotificationSettingsUsecaseProvider).getSettings(userId);
      final updatedSettings = NotificationSettingsEntity(
        id: currentSettings?.id ?? 0,
        userId: userId,
        mealReminderMinutes: currentSettings?.mealReminderMinutes ?? const {},
        dailySummaryEnabled: enabled,
        dailySummaryMinutes: currentSettings?.dailySummaryMinutes ?? 0,
      );
      await ref.read(saveNotificationSettingsUsecaseProvider).saveSettings(updatedSettings);
      state = NotificationSettingsState(settings: updatedSettings);
    } catch (e) {
      state = NotificationSettingsState(errorMessage: e.toString());
    }
  }

  Future<void> updateMealReminderTime(
    int userId,
    IntakeTypeEntity intakeType,
    int minutes,
  ) async {
    try {
      final currentSettings =
          await ref.read(getNotificationSettingsUsecaseProvider).getSettings(userId);
      final updatedMealReminderMinutes = Map<IntakeTypeEntity, int>.from(
        currentSettings?.mealReminderMinutes ?? const {},
      )..[intakeType] = minutes;
      final updatedSettings = NotificationSettingsEntity(
        id: currentSettings?.id ?? 0,
        userId: userId,
        mealReminderMinutes: updatedMealReminderMinutes,
        dailySummaryEnabled: currentSettings?.dailySummaryEnabled ?? false,
        dailySummaryMinutes: currentSettings?.dailySummaryMinutes ?? 0,
      );
      await ref.read(saveNotificationSettingsUsecaseProvider).saveSettings(updatedSettings);
      state = NotificationSettingsState(settings: updatedSettings);
    } catch (e) {
      state = NotificationSettingsState(errorMessage: e.toString());
    }
  }
}

final notificationSettingsNotifierProvider =
    NotifierProvider<NotificationSettingsNotifier, NotificationSettingsState>(NotificationSettingsNotifier.new);