part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationSettingsInitial extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationSettingsLoading extends NotificationState {
  @override
  List<Object?> get props => [];
}

class NotificationSettingsLoaded extends NotificationState {
  final NotificationSettingsEntity settings;

  const NotificationSettingsLoaded(this.settings);

  @override
  List<Object?> get props => [settings];
}

class NotificationSettingsError extends NotificationState {
  final String message;

  const NotificationSettingsError(this.message);

  @override
  List<Object?> get props => [message];
}
