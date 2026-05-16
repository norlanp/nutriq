// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';

TrackedDayEntity mapTrackedDayToEntity(TrackedDay entry) => TrackedDayEntity(
      day: entry.day,
      calorieGoal: entry.calorieGoal,
      caloriesTracked: entry.caloriesTracked,
      carbsGoal: entry.carbsGoal,
      carbsTracked: entry.carbsTracked,
      fatGoal: entry.fatGoal,
      fatTracked: entry.fatTracked,
      proteinGoal: entry.proteinGoal,
      proteinTracked: entry.proteinTracked,
    );

TrackedDaysCompanion mapTrackedDayEntityToCompanion(
  TrackedDayEntity entity,
) =>
    TrackedDaysCompanion(
      day: Value(entity.day),
      calorieGoal: Value(entity.calorieGoal),
      caloriesTracked: Value(entity.caloriesTracked),
      carbsGoal: Value(entity.carbsGoal),
      carbsTracked: Value(entity.carbsTracked),
      fatGoal: Value(entity.fatGoal),
      fatTracked: Value(entity.fatTracked),
      proteinGoal: Value(entity.proteinGoal),
      proteinTracked: Value(entity.proteinTracked),
    );