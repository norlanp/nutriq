import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';

class TrackedDayEntityFixtures {
  static TrackedDayEntity trackedDayOne = TrackedDayEntity(
    day: DateTime.utc(2024, 1, 1),
    calorieGoal: 2000,
    caloriesTracked: 500,
    carbsGoal: 250,
    carbsTracked: 60,
    fatGoal: 65,
    fatTracked: 20,
    proteinGoal: 120,
    proteinTracked: 30,
  );

  static TrackedDayEntity trackedDayTwo = TrackedDayEntity(
    day: DateTime.utc(2024, 1, 2),
    calorieGoal: 2200,
    caloriesTracked: 800,
    carbsGoal: 275,
    carbsTracked: 100,
    fatGoal: 70,
    fatTracked: 35,
    proteinGoal: 130,
    proteinTracked: 50,
  );

  static TrackedDayEntity trackedDayThree = TrackedDayEntity(
    day: DateTime.utc(2024, 1, 3),
    calorieGoal: 1800,
    caloriesTracked: 0,
    carbsGoal: 225,
    carbsTracked: 0,
    fatGoal: 60,
    fatTracked: 0,
    proteinGoal: 110,
    proteinTracked: 0,
  );
}
