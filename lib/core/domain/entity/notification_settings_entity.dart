import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';

class NotificationSettingsEntity extends Equatable {
  final int id;
  final int userId;
  final Map<IntakeTypeEntity, int> mealReminderMinutes;
  final bool dailySummaryEnabled;
  final int dailySummaryMinutes;

  const NotificationSettingsEntity({
    required this.id,
    required this.userId,
    required this.mealReminderMinutes,
    required this.dailySummaryEnabled,
    required this.dailySummaryMinutes,
  });

  @override
  List<Object?> get props => [
        id,
        userId,
        mealReminderMinutes,
        dailySummaryEnabled,
        dailySummaryMinutes,
      ];
}
