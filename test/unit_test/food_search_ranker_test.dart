import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/add_meal/domain/service/food_search_ranker.dart';

void main() {
  const ranker = FoodSearchRanker();

  test('tokenize normalizes punctuation and casing', () {
    expect(
      FoodSearchRanker.tokenize('Chick-fil-A CHICKEN Sandwich!'),
      ['chick', 'fil', 'a', 'chicken', 'sandwich'],
    );
  });

  test('ranks the branded match above a generic one', () {
    final generic = _meal(
      name: 'Chicken sandwich',
      source: MealSourceEntity.fdc,
    );
    final branded = _meal(
      name: 'Chick-fil-A Chicken Sandwich',
      brands: 'Chick-fil-A',
      source: MealSourceEntity.fdc,
    );

    final ranked = ranker.rank([generic, branded], 'chic-fil-a sandwich');

    expect(ranked.first.name, 'Chick-fil-A Chicken Sandwich');
  });

  test('drops candidates with no meaningful token overlap', () {
    final relevant = _meal(
      name: 'Granny Smith Apple',
      brands: 'Produce',
    );
    final irrelevant = _meal(
      name: 'Dish soap lemon',
      brands: 'CleanCo',
    );

    final ranked = ranker.rank([irrelevant, relevant], 'apple');

    expect(ranked.map((meal) => meal.name), ['Granny Smith Apple']);
  });

  test('removes duplicates, keeping the nutritionally complete record', () {
    final incomplete = _meal(name: 'Whole Milk', brands: 'Dairy Co');
    final complete = _meal(
      name: 'Whole Milk',
      brands: 'Dairy Co',
      nutriments: const MealNutrimentsEntity(
        energyKcal100: 61,
        carbohydrates100: 4.8,
        fat100: 3.3,
        proteins100: 3.2,
        sugars100: 5.1,
        saturatedFat100: 1.9,
        fiber100: 0,
      ),
    );

    final ranked = ranker.rank([incomplete, complete], 'whole milk');

    expect(ranked.length, 1);
    expect(ranked.single.nutriments.energyKcal100, 61);
  });

  test('returns candidates unchanged for an empty query', () {
    final meals = [_meal(name: 'Apple'), _meal(name: 'Banana')];
    expect(ranker.rank(meals, '   '), meals);
  });
}

MealEntity _meal({
  String? name,
  String? brands,
  MealSourceEntity source = MealSourceEntity.off,
  MealNutrimentsEntity nutriments = const MealNutrimentsEntity(
    energyKcal100: null,
    carbohydrates100: null,
    fat100: null,
    proteins100: null,
    sugars100: null,
    saturatedFat100: null,
    fiber100: null,
  ),
}) {
  return MealEntity(
    code: null,
    name: name,
    brands: brands,
    url: null,
    mealQuantity: null,
    mealUnit: 'g',
    servingQuantity: null,
    servingUnit: 'g',
    servingSize: null,
    nutriments: nutriments,
    source: source,
  );
}
