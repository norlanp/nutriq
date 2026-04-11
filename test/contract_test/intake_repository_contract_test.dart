import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/intake_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/intake_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/repository/intake_repository.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

void main() {
  late AppDatabase db;
  late IntakeRepository repo;

  final testMeal = MealEntity(
    code: 'meal-1',
    name: 'Test Food',
    url: null,
    mealQuantity: null,
    mealUnit: 'g',
    servingQuantity: null,
    servingUnit: 'g',
    servingSize: '1 serving (100g)',
    nutriments: MealNutrimentsEntity.empty(),
    source: MealSourceEntity.custom,
  );

  final testIntake = IntakeEntity(
    id: 'intake-1',
    unit: 'g',
    amount: 150.0,
    type: IntakeTypeEntity.lunch,
    meal: testMeal,
    dateTime: DateTime(2024, 6, 15, 12, 0),
  );

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = IntakeRepository(
      IntakeDataSource(IntakeDao(db)),
      MealDao(db),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('addIntake persists and retrieves intake', () async {
    await repo.addIntake(testIntake);
    final result = await repo.getIntakeById('intake-1');
    expect(result, isNotNull);
    expect(result!.id, 'intake-1');
    expect(result.amount, 150.0);
    expect(result.type, IntakeTypeEntity.lunch);
    expect(result.meal.code, 'meal-1');
  });

  test('deleteIntake removes intake', () async {
    await repo.addIntake(testIntake);
    await repo.deleteIntake(testIntake);
    final result = await repo.getIntakeById('intake-1');
    expect(result, isNull);
  });

  test('updateIntake updates amount', () async {
    await repo.addIntake(testIntake);
    final updated = await repo.updateIntake('intake-1', {'amount': 200.0});
    expect(updated, isNotNull);
    expect(updated!.amount, 200.0);
  });

  test('getIntakeByDateAndType returns matching intakes', () async {
    await repo.addIntake(testIntake);
    final results = await repo.getIntakeByDateAndType(
      IntakeTypeEntity.lunch,
      DateTime(2024, 6, 15),
    );
    expect(results.length, 1);
    expect(results.first.id, 'intake-1');
  });

  test('getIntakeByDateAndType returns empty for different type', () async {
    await repo.addIntake(testIntake);
    final results = await repo.getIntakeByDateAndType(
      IntakeTypeEntity.breakfast,
      DateTime(2024, 6, 15),
    );
    expect(results, isEmpty);
  });

  test('getRecentIntake returns intakes', () async {
    await repo.addIntake(testIntake);
    final results = await repo.getRecentIntake();
    expect(results.isNotEmpty, true);
    expect(results.first.id, 'intake-1');
  });

  test('getIntakeById returns null for nonexistent intake', () async {
    final result = await repo.getIntakeById('nonexistent');
    expect(result, isNull);
  });
}
