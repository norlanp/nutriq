import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';

class NotificationSettingsState extends Equatable {
  final NotificationSettingsEntity? settings;
  final bool isLoading;
  final String? errorMessage;

  const NotificationSettingsState({
    this.settings,
    this.isLoading = false,
    this.errorMessage,
  });

  bool get isLoaded => settings != null;
  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [settings, isLoading, errorMessage];
}