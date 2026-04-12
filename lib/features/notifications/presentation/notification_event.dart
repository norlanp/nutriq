part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class LoadNotificationSettings extends NotificationEvent {
  final int userId;

  const LoadNotificationSettings(this.userId);

  @override
  List<Object?> get props => [userId];
}

class SaveNotificationSettings extends NotificationEvent {
  final NotificationSettingsEntity settings;

  const SaveNotificationSettings(this.settings);

  @override
  List<Object?> get props => [settings];
}

class ToggleDailySummary extends NotificationEvent {
  final int userId;
  final bool enabled;

  const ToggleDailySummary(this.userId, this.enabled);

  @override
  List<Object?> get props => [userId, enabled];
}

class UpdateMealReminderTime extends NotificationEvent {
  final int userId;
  final IntakeTypeEntity intakeType;
  final int minutes;

  const UpdateMealReminderTime(this.userId, this.intakeType, this.minutes);

  @override
  List<Object?> get props => [userId, intakeType, minutes];
}
