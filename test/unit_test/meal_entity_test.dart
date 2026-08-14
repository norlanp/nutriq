import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_nutriment_dto.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

void main() {
  test('maps FDC serving quantity and unit to a serving label', () {
    final meal = MealEntity.fromFDCFood(
      FDCFoodDTO(
        fdcId: 123,
        gtinUpc: null,
        description: 'Test food',
        brandOwner: null,
        brandName: null,
        packageWeight: null,
        servingSize: 30,
        servingSizeUnit: 'g',
        foodNutrients: const [],
      ),
    );

    expect(meal.servingSize, '30.0 g');
  });

  test('maps FDC identifiers, details, and nutrients', () {
    final meal = MealEntity.fromFDCFood(
      FDCFoodDTO(
        fdcId: 123,
        gtinUpc: null,
        description: 'Test food',
        brandOwner: null,
        brandName: 'Test brand',
        packageWeight: '500 g',
        servingSize: 30,
        servingSizeUnit: 'g',
        foodNutrients: [
          FDCFoodNutrimentDTO(
            nutrientId: FDCConst.fdcTotalKcalId,
            amount: 100,
          ),
          FDCFoodNutrimentDTO(
            nutrientId: FDCConst.fdcTotalCarbsId,
            amount: 20,
          ),
          FDCFoodNutrimentDTO(
            nutrientId: FDCConst.fdcTotalProteinsId,
            amount: 5,
          ),
        ],
      ),
    );

    expect(meal.code, '123');
    expect(meal.brands, 'Test brand');
    expect(meal.url, contains('/food-details/123/nutrients'));
    expect(meal.source, MealSourceEntity.fdc);
    expect(meal.nutriments.energyKcal100, 100);
    expect(meal.nutriments.carbohydrates100, 20);
    expect(meal.nutriments.proteins100, 5);
    expect(meal.nutriments.fat100, isNull);
  });

  test('uses the Atwater energy value when total energy is absent', () {
    final meal = MealEntity.fromFDCFood(
      FDCFoodDTO(
        fdcId: null,
        gtinUpc: null,
        description: null,
        brandOwner: null,
        brandName: null,
        packageWeight: null,
        servingSize: null,
        servingSizeUnit: null,
        foodNutrients: [
          FDCFoodNutrimentDTO(
            nutrientId: FDCConst.fdcKcalAtwaterGeneralId,
            amount: 90,
          ),
        ],
      ),
    );

    expect(meal.code, isNull);
    expect(meal.nutriments.energyKcal100, 90);
  });
}
