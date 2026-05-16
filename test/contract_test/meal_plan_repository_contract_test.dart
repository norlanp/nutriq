import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/meal_plan_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/meal_plan_dao.dart';
import 'package:nutriq/core/data/repository/meal_plan_repository.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';

void main() {
  late AppDatabase db;
  late MealPlanRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = MealPlanRepository(MealPlanDataSource(MealPlanDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('addPlan persists and getByDate retrieves', () async {
    final entity = MealPlanEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      mealSlot: IntakeTypeEntity.lunch,
    );
    await repo.addPlan(entity);
    final results = await repo.getByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.mealSlot, IntakeTypeEntity.lunch);
  });

  test('getByDate returns empty when no plans', () async {
    final results = await repo.getByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });

  test('getByWeek returns plans in date range', () async {
    final entity1 = MealPlanEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 10),
      mealSlot: IntakeTypeEntity.breakfast,
    );
    final entity2 = MealPlanEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 12),
      mealSlot: IntakeTypeEntity.lunch,
    );
    await repo.addPlan(entity1);
    await repo.addPlan(entity2);
    final results = await repo.getByWeek(
      DateTime(2024, 6, 10),
      DateTime(2024, 6, 16),
    );
    expect(results.length, 2);
  });

  test('deletePlan removes plan', () async {
    final entity = MealPlanEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      mealSlot: IntakeTypeEntity.lunch,
    );
    await repo.addPlan(entity);
    await repo.deletePlan(1);
    final results = await repo.getByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });
}