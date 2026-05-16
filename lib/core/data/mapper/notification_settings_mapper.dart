// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';

NotificationSettingsEntity mapNotificationSettingsToEntity(
  NotificationSetting data,
) =>
    NotificationSettingsEntity(
      id: data.id,
      userId: data.userId,
      mealReminderMinutes: {
        if (data.breakfastTime != null)
          IntakeTypeEntity.breakfast: data.breakfastTime!,
        if (data.lunchTime != null) IntakeTypeEntity.lunch: data.lunchTime!,
        if (data.dinnerTime != null) IntakeTypeEntity.dinner: data.dinnerTime!,
        if (data.snackTime != null) IntakeTypeEntity.snack: data.snackTime!,
      },
      dailySummaryEnabled: data.dailySummaryEnabled,
      dailySummaryMinutes: data.dailySummaryTime ?? 0,
    );

NotificationSettingsCompanion mapNotificationSettingsEntityToCompanion(
  NotificationSettingsEntity entity,
) =>
    NotificationSettingsCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      breakfastTime:
          Value(entity.mealReminderMinutes[IntakeTypeEntity.breakfast]),
      lunchTime: Value(entity.mealReminderMinutes[IntakeTypeEntity.lunch]),
      dinnerTime: Value(entity.mealReminderMinutes[IntakeTypeEntity.dinner]),
      snackTime: Value(entity.mealReminderMinutes[IntakeTypeEntity.snack]),
      dailySummaryEnabled: Value(entity.dailySummaryEnabled),
      dailySummaryTime: Value(entity.dailySummaryMinutes),
    );