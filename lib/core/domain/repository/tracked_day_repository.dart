import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';

abstract class TrackedDayRepository {
  Future<TrackedDayEntity?> getTrackedDay(DateTime day);

  Future<bool> hasTrackedDay(DateTime day);

  Future<List<TrackedDayEntity>> getTrackedDayByRange(
    DateTime start,
    DateTime end,
  );

  Future<void> updateDayCalorieGoal(DateTime day, double calorieGoal);

  Future<void> increaseDayCalorieGoal(DateTime day, double amount);

  Future<void> reduceDayCalorieGoal(DateTime day, double amount);

  Future<void> addNewTrackedDay(
    DateTime day,
    double totalKcalGoal,
    double totalCarbsGoal,
    double totalFatGoal,
    double totalProteinGoal,
  );

  Future<void> addDayTrackedCalories(DateTime day, double addCalories);

  Future<void> removeDayTrackedCalories(DateTime day, double addCalories);

  Future<void> updateDayMacroGoal(
    DateTime day, {
    double? carbGoal,
    double? fatGoal,
    double? proteinGoal,
  });

  Future<void> increaseDayMacroGoal(
    DateTime day, {
    double? carbGoal,
    double? fatGoal,
    double? proteinGoal,
  });

  Future<void> reduceDayMacroGoal(
    DateTime day, {
    double? carbGoal,
    double? fatGoal,
    double? proteinGoal,
  });

  Future<void> addDayMacrosTracked(
    DateTime day, {
    double? carbsTracked,
    double? fatTracked,
    double? proteinTracked,
  });

  Future<void> removeDayMacrosTracked(
    DateTime day, {
    double? carbsTracked,
    double? fatTracked,
    double? proteinTracked,
  });
}
