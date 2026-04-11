import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/tracked_day_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/tracked_day_dao.dart';
import 'package:nutriq/core/data/repository/tracked_day_repository.dart';

void main() {
  late AppDatabase db;
  late TrackedDayRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = TrackedDayRepository(
      TrackedDayDataSource(TrackedDayDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('hasTrackedDay returns false before adding', () async {
    final result = await repo.hasTrackedDay(DateTime(2024, 6, 15));
    expect(result, false);
  });

  test('addNewTrackedDay creates a tracked day', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    final result = await repo.hasTrackedDay(DateTime(2024, 6, 15));
    expect(result, true);
  });

  test('getTrackedDay returns day with correct values', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day, isNotNull);
    expect(day!.calorieGoal, 2000);
    expect(day.caloriesTracked, 0);
    expect(day.carbsGoal, 250);
    expect(day.fatGoal, 65);
    expect(day.proteinGoal, 120);
  });

  test('getTrackedDay returns null for nonexistent day', () async {
    final day = await repo.getTrackedDay(DateTime(2024, 1, 1));
    expect(day, isNull);
  });

  test('updateDayCalorieGoal updates goal', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.updateDayCalorieGoal(DateTime(2024, 6, 15), 2200);
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.calorieGoal, 2200);
  });

  test('increaseDayCalorieGoal increases goal', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.increaseDayCalorieGoal(DateTime(2024, 6, 15), 200);
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.calorieGoal, 2200);
  });

  test('reduceDayCalorieGoal reduces goal', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.reduceDayCalorieGoal(DateTime(2024, 6, 15), 200);
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.calorieGoal, 1800);
  });

  test('addDayTrackedCalories adds tracked calories', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.addDayTrackedCalories(DateTime(2024, 6, 15), 500);
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.caloriesTracked, 500);
  });

  test('removeDayTrackedCalories subtracts tracked calories', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.addDayTrackedCalories(DateTime(2024, 6, 15), 500);
    await repo.removeDayTrackedCalories(DateTime(2024, 6, 15), 200);
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.caloriesTracked, 300);
  });

  test('getTrackedDayByRange returns days in range', () async {
    await repo.addNewTrackedDay(DateTime(2024, 6, 15), 2000, 250, 65, 120);
    await repo.addNewTrackedDay(DateTime(2024, 6, 16), 2100, 260, 70, 125);
    await repo.addNewTrackedDay(DateTime(2024, 6, 20), 1800, 225, 60, 110);

    final results = await repo.getTrackedDayByRange(
      DateTime(2024, 6, 15),
      DateTime(2024, 6, 17),
    );
    expect(results.length, 2);
  });

  test('addDayMacrosTracked adds macro values', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.addDayMacrosTracked(
      DateTime(2024, 6, 15),
      carbsTracked: 60,
      fatTracked: 20,
      proteinTracked: 30,
    );
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.carbsTracked, 60);
    expect(day.fatTracked, 20);
    expect(day.proteinTracked, 30);
  });

  test('removeDayMacrosTracked subtracts macro values', () async {
    await repo.addNewTrackedDay(
      DateTime(2024, 6, 15),
      2000,
      250,
      65,
      120,
    );
    await repo.addDayMacrosTracked(
      DateTime(2024, 6, 15),
      carbsTracked: 100,
      fatTracked: 40,
      proteinTracked: 50,
    );
    await repo.removeDayMacrosTracked(
      DateTime(2024, 6, 15),
      carbsTracked: 40,
      fatTracked: 20,
      proteinTracked: 25,
    );
    final day = await repo.getTrackedDay(DateTime(2024, 6, 15));
    expect(day!.carbsTracked, 60);
    expect(day.fatTracked, 20);
    expect(day.proteinTracked, 25);
  });
}
