import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

MealNutrimentsEntity _makeNutriments({
  double energyKcal100 = 200,
  double carbs100 = 50,
  double fat100 = 10,
  double proteins100 = 20,
}) {
  return MealNutrimentsEntity(
    energyKcal100: energyKcal100,
    carbohydrates100: carbs100,
    fat100: fat100,
    proteins100: proteins100,
    sugars100: 5,
    saturatedFat100: 3,
    fiber100: 2,
  );
}

IntakeEntity _makeIntake({
  double amount = 2.0,
  double energyKcal100 = 200,
  double carbs100 = 50,
  double fat100 = 10,
  double proteins100 = 20,
}) {
  return IntakeEntity(
    id: 'test-id',
    unit: 'g',
    amount: amount,
    type: IntakeTypeEntity.breakfast,
    meal: MealEntity(
      code: 'test-code',
      name: 'Test Meal',
      url: 'https://example.com',
      mealQuantity: '100g',
      mealUnit: 'g',
      servingQuantity: 1.0,
      servingUnit: 'g',
      servingSize: '100g',
      nutriments: _makeNutriments(
        energyKcal100: energyKcal100,
        carbs100: carbs100,
        fat100: fat100,
        proteins100: proteins100,
      ),
      source: MealSourceEntity.custom,
    ),
    dateTime: DateTime(2025, 1, 15),
  );
}

void main() {
  group('IntakeEntity computed properties', () {
    test('totalKcal computes amount * energyPerUnit', () {
      final intake = _makeIntake(amount: 2.0, energyKcal100: 400);
      expect(intake.totalKcal, closeTo(2.0 * 4.0, 0.01));
    });

    test('totalCarbsGram computes amount * carbsPerUnit', () {
      final intake = _makeIntake(amount: 3.0, carbs100: 500);
      expect(intake.totalCarbsGram, closeTo(3.0 * 5.0, 0.01));
    });

    test('totalFatsGram computes amount * fatPerUnit', () {
      final intake = _makeIntake(amount: 2.5, fat100: 200);
      expect(intake.totalFatsGram, closeTo(2.5 * 2.0, 0.01));
    });

    test('totalProteinsGram computes amount * proteinsPerUnit', () {
      final intake = _makeIntake(amount: 1.5, proteins100: 300);
      expect(intake.totalProteinsGram, closeTo(1.5 * 3.0, 0.01));
    });

    test('netCarbsPerUnit computes carbs minus fiber per 100g', () {
      final intake = _makeIntake(carbs100: 50, amount: 1.0);
      expect(intake.totalNetCarbsGram, closeTo(1.0 * (50 - 2) / 100, 0.01));
    });

    test('energyPerUnit returns kcal per unit', () {
      final intake = _makeIntake(energyKcal100: 400);
      expect(intake.meal.nutriments.energyPerUnit, closeTo(4.0, 0.01));
    });

    test('netCarbsPerUnit returns 0 when carbs100 is null', () {
      final intake = IntakeEntity(
        id: 'test-id',
        unit: 'g',
        amount: 1.0,
        type: IntakeTypeEntity.breakfast,
        meal: MealEntity(
          code: 'code',
          name: null,
          url: null,
          mealQuantity: null,
          mealUnit: 'g',
          servingQuantity: null,
          servingUnit: 'g',
          servingSize: '',
          nutriments: MealNutrimentsEntity.empty(),
          source: MealSourceEntity.custom,
        ),
        dateTime: DateTime(2025, 1, 15),
      );
      expect(intake.totalNetCarbsGram, 0);
    });
  });
}