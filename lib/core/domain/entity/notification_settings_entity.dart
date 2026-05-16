import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';

part 'notification_settings_entity.freezed.dart';

@freezed
class NotificationSettingsEntity with _$NotificationSettingsEntity {
  const NotificationSettingsEntity._();

  const factory NotificationSettingsEntity({
    required int id,
    required int userId,
    required Map<IntakeTypeEntity, int> mealReminderMinutes,
    required bool dailySummaryEnabled,
    required int dailySummaryMinutes,
  }) = _NotificationSettingsEntity;
}