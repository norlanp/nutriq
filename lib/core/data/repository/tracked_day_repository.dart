import 'package:drift/drift.dart';
import 'package:nutriq/core/data/data_source/tracked_day_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart'
    as domain;

class TrackedDayRepository implements domain.TrackedDayRepository {
  final TrackedDayDataSource _trackedDayDataSource;

  TrackedDayRepository(this._trackedDayDataSource);

  Future<List<TrackedDay>> getAllTrackedDaysData() async {
    return await _trackedDayDataSource.getAllTrackedDays();
  }

  @override
  Future<TrackedDayEntity?> getTrackedDay(DateTime day) async {
    final trackedDay = await _trackedDayDataSource.getTrackedDay(day);
    if (trackedDay != null) {
      return mapTrackedDayToEntity(trackedDay);
    } else {
      return null;
    }
  }

  @override
  Future<bool> hasTrackedDay(DateTime day) async {
    final trackedDay = await getTrackedDay(day);
    return trackedDay != null;
  }

  @override
  Future<List<TrackedDayEntity>> getTrackedDayByRange(
    DateTime start,
    DateTime end,
  ) async {
    final trackedDays =
        await _trackedDayDataSource.getTrackedDaysInRange(start, end);

    return trackedDays
        .map((trackedDay) => mapTrackedDayToEntity(trackedDay))
        .toList();
  }

  @override
  Future<void> updateDayCalorieGoal(DateTime day, double calorieGoal) async {
    await _trackedDayDataSource.updateDayCalorieGoal(day, calorieGoal);
  }

  @override
  Future<void> increaseDayCalorieGoal(DateTime day, double amount) async {
    await _trackedDayDataSource.increaseDayCalorieGoal(day, amount);
  }

  @override
  Future<void> reduceDayCalorieGoal(DateTime day, double amount) async {
    await _trackedDayDataSource.reduceDayCalorieGoal(day, amount);
  }

  @override
  Future<void> addNewTrackedDay(
    DateTime day,
    double totalKcalGoal,
    double totalCarbsGoal,
    double totalFatGoal,
    double totalProteinGoal,
  ) async {
    await _trackedDayDataSource.saveTrackedDay(
      TrackedDaysCompanion.insert(
        day: day,
        calorieGoal: totalKcalGoal,
        caloriesTracked: const Value(0.0),
        carbsGoal: Value(totalCarbsGoal),
        carbsTracked: const Value(0),
        fatGoal: Value(totalFatGoal),
        fatTracked: const Value(0),
        proteinGoal: Value(totalProteinGoal),
        proteinTracked: const Value(0),
      ),
    );
  }

  Future<void> addAllTrackedDaysData(
    List<TrackedDaysCompanion> companions,
  ) async {
    await _trackedDayDataSource.saveAllTrackedDays(companions);
  }

  @override
  Future<void> addDayTrackedCalories(DateTime day, double addCalories) async {
    if (await _trackedDayDataSource.hasTrackedDay(day)) {
      await _trackedDayDataSource.addDayCaloriesTracked(day, addCalories);
    }
  }

  @override
  Future<void> removeDayTrackedCalories(
    DateTime day,
    double addCalories,
  ) async {
    if (await _trackedDayDataSource.hasTrackedDay(day)) {
      await _trackedDayDataSource.decreaseDayCaloriesTracked(day, addCalories);
    }
  }

  @override
  Future<void> updateDayMacroGoal(
    DateTime day, {
    double? carbGoal,
    double? fatGoal,
    double? proteinGoal,
  }) async {
    await _trackedDayDataSource.updateDayMacroGoals(
      day,
      carbsGoal: carbGoal,
      fatGoal: fatGoal,
      proteinGoal: proteinGoal,
    );
  }

  @override
  Future<void> increaseDayMacroGoal(
    DateTime day, {
    double? carbGoal,
    double? fatGoal,
    double? proteinGoal,
  }) async {
    await _trackedDayDataSource.increaseDayMacroGoal(
      day,
      carbsAmount: carbGoal,
      fatAmount: fatGoal,
      proteinAmount: proteinGoal,
    );
  }

  @override
  Future<void> reduceDayMacroGoal(
    DateTime day, {
    double? carbGoal,
    double? fatGoal,
    double? proteinGoal,
  }) async {
    await _trackedDayDataSource.reduceDayMacroGoal(
      day,
      carbsAmount: carbGoal,
      fatAmount: fatGoal,
      proteinAmount: proteinGoal,
    );
  }

  @override
  Future<void> addDayMacrosTracked(
    DateTime day, {
    double? carbsTracked,
    double? fatTracked,
    double? proteinTracked,
  }) async {
    await _trackedDayDataSource.addDayMacroTracked(
      day,
      carbsAmount: carbsTracked,
      fatAmount: fatTracked,
      proteinAmount: proteinTracked,
    );
  }

  @override
  Future<void> removeDayMacrosTracked(
    DateTime day, {
    double? carbsTracked,
    double? fatTracked,
    double? proteinTracked,
  }) async {
    await _trackedDayDataSource.removeDayMacroTracked(
      day,
      carbsAmount: carbsTracked,
      fatAmount: fatTracked,
      proteinAmount: proteinTracked,
    );
  }

  @override
  Future<void> importAllFromJson(List<Map<String, dynamic>> jsonList) async {
    final companions = jsonList
        .map((json) => TrackedDay.fromJson(json).toCompanion(false))
        .toList();
    await _trackedDayDataSource.saveAllTrackedDays(companions);
  }

  @override
  Future<List<Map<String, dynamic>>> exportAllToJson() async {
    final data = await _trackedDayDataSource.getAllTrackedDays();
    return data.map((item) => item.toJson()).toList();
  }
}
