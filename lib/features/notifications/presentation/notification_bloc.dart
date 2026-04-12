import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';
import 'package:nutriq/core/domain/usecase/notification/get_notification_settings_usecase.dart';
import 'package:nutriq/core/domain/usecase/notification/save_notification_settings_usecase.dart';

part 'notification_event.dart';

part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationSettingsUsecase _getNotificationSettingsUsecase;
  final SaveNotificationSettingsUsecase _saveNotificationSettingsUsecase;

  NotificationBloc(
    this._getNotificationSettingsUsecase,
    this._saveNotificationSettingsUsecase,
  ) : super(NotificationSettingsInitial()) {
    on<LoadNotificationSettings>(_onLoadNotificationSettings);
    on<SaveNotificationSettings>(_onSaveNotificationSettings);
    on<ToggleDailySummary>(_onToggleDailySummary);
    on<UpdateMealReminderTime>(_onUpdateMealReminderTime);
  }

  Future<void> _onLoadNotificationSettings(
    LoadNotificationSettings event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationSettingsLoading());

    try {
      final settings =
          await _getNotificationSettingsUsecase.getSettings(event.userId);
      if (settings != null) {
        emit(NotificationSettingsLoaded(settings));
      } else {
        emit(const NotificationSettingsError('Settings not found'));
      }
    } catch (e) {
      emit(NotificationSettingsError(e.toString()));
    }
  }

  Future<void> _onSaveNotificationSettings(
    SaveNotificationSettings event,
    Emitter<NotificationState> emit,
  ) async {
    emit(NotificationSettingsLoading());

    try {
      await _saveNotificationSettingsUsecase.saveSettings(event.settings);
      emit(NotificationSettingsLoaded(event.settings));
    } catch (e) {
      emit(NotificationSettingsError(e.toString()));
    }
  }

  Future<void> _onToggleDailySummary(
    ToggleDailySummary event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      final currentSettings =
          await _getNotificationSettingsUsecase.getSettings(event.userId);
      final updatedSettings = NotificationSettingsEntity(
        id: currentSettings?.id ?? 0,
        userId: event.userId,
        mealReminderMinutes: currentSettings?.mealReminderMinutes ?? const {},
        dailySummaryEnabled: event.enabled,
        dailySummaryMinutes: currentSettings?.dailySummaryMinutes ?? 0,
      );
      await _saveNotificationSettingsUsecase.saveSettings(updatedSettings);
      emit(NotificationSettingsLoaded(updatedSettings));
    } catch (e) {
      emit(NotificationSettingsError(e.toString()));
    }
  }

  Future<void> _onUpdateMealReminderTime(
    UpdateMealReminderTime event,
    Emitter<NotificationState> emit,
  ) async {
    try {
      final currentSettings =
          await _getNotificationSettingsUsecase.getSettings(event.userId);
      final updatedMealReminderMinutes = Map<IntakeTypeEntity, int>.from(
        currentSettings?.mealReminderMinutes ?? const {},
      )..[event.intakeType] = event.minutes;
      final updatedSettings = NotificationSettingsEntity(
        id: currentSettings?.id ?? 0,
        userId: event.userId,
        mealReminderMinutes: updatedMealReminderMinutes,
        dailySummaryEnabled: currentSettings?.dailySummaryEnabled ?? false,
        dailySummaryMinutes: currentSettings?.dailySummaryMinutes ?? 0,
      );
      await _saveNotificationSettingsUsecase.saveSettings(updatedSettings);
      emit(NotificationSettingsLoaded(updatedSettings));
    } catch (e) {
      emit(NotificationSettingsError(e.toString()));
    }
  }
}
