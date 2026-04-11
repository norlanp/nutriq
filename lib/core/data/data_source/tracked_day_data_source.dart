import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/tracked_day_dao.dart';

class TrackedDayDataSource {
  final TrackedDayDao _dao;

  TrackedDayDataSource(this._dao);

  Future<void> saveTrackedDay(TrackedDaysCompanion day) =>
      _dao.saveTrackedDay(day);

  Future<void> saveAllTrackedDays(List<TrackedDaysCompanion> days) =>
      _dao.saveAllTrackedDays(days);

  Future<List<TrackedDay>> getAllTrackedDays() => _dao.getAllTrackedDays();

  Future<TrackedDay?> getTrackedDay(DateTime day) => _dao.getTrackedDay(day);

  Future<List<TrackedDay>> getTrackedDaysInRange(
          DateTime start, DateTime end) =>
      _dao.getTrackedDaysInRange(start, end);

  Future<bool> hasTrackedDay(DateTime day) => _dao.hasTrackedDay(day);

  Future<void> updateDayCalorieGoal(DateTime day, double calorieGoal) =>
      _dao.updateDayCalorieGoal(day, calorieGoal);

  Future<void> increaseDayCalorieGoal(DateTime day, double amount) =>
      _dao.increaseDayCalorieGoal(day, amount);

  Future<void> reduceDayCalorieGoal(DateTime day, double amount) =>
      _dao.reduceDayCalorieGoal(day, amount);

  Future<void> addDayCaloriesTracked(DateTime day, double calories) =>
      _dao.addDayCaloriesTracked(day, calories);

  Future<void> decreaseDayCaloriesTracked(DateTime day, double calories) =>
      _dao.decreaseDayCaloriesTracked(day, calories);

  Future<void> updateDayMacroGoals(
    DateTime day, {
    double? carbsGoal,
    double? fatGoal,
    double? proteinGoal,
  }) =>
      _dao.updateDayMacroGoals(
        day,
        carbsGoal: carbsGoal,
        fatGoal: fatGoal,
        proteinGoal: proteinGoal,
      );

  Future<void> increaseDayMacroGoal(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) =>
      _dao.increaseDayMacroGoal(
        day,
        carbsAmount: carbsAmount,
        fatAmount: fatAmount,
        proteinAmount: proteinAmount,
      );

  Future<void> reduceDayMacroGoal(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) =>
      _dao.reduceDayMacroGoal(
        day,
        carbsAmount: carbsAmount,
        fatAmount: fatAmount,
        proteinAmount: proteinAmount,
      );

  Future<void> addDayMacroTracked(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) =>
      _dao.addDayMacroTracked(
        day,
        carbsAmount: carbsAmount,
        fatAmount: fatAmount,
        proteinAmount: proteinAmount,
      );

  Future<void> removeDayMacroTracked(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) =>
      _dao.removeDayMacroTracked(
        day,
        carbsAmount: carbsAmount,
        fatAmount: fatAmount,
        proteinAmount: proteinAmount,
      );
}
