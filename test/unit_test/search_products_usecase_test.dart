import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';

class MockProductsRepository extends Mock implements ProductsRepository {}

void main() {
  late MockProductsRepository repository;
  late SearchProductsUseCase useCase;

  setUp(() {
    repository = MockProductsRepository();
    useCase = SearchProductsUseCase(repository);
  });

  test('merges branded sources and ranks the brand match first', () async {
    final generic = _meal(
      name: 'Chicken sandwich',
      source: MealSourceEntity.off,
    );
    final branded = _meal(
      name: 'Chick-fil-A Chicken Sandwich',
      brands: 'Chick-fil-A',
      source: MealSourceEntity.fdc,
    );
    when(
      () => repository.getOFFProductsByString('chic-fil-a sandwich'),
    ).thenAnswer((_) async => [generic]);
    when(
      () => repository.getFDCFoodsByString(
        'chic-fil-a sandwich',
        dataTypes: FDCConst.brandedDataTypes,
      ),
    ).thenAnswer((_) async => [branded]);

    final results = await useCase.searchBrandedFoods('chic-fil-a sandwich');

    expect(results.map((meal) => meal.name), [
      'Chick-fil-A Chicken Sandwich',
      'Chicken sandwich',
    ]);
  });

  test('keeps results from a healthy source when the other fails', () async {
    final branded = _meal(
      name: 'Chick-fil-A Chicken Sandwich',
      brands: 'Chick-fil-A',
      source: MealSourceEntity.fdc,
    );
    when(
      () => repository.getOFFProductsByString('chic-fil-a sandwich'),
    ).thenThrow(Exception('OFF unavailable'));
    when(
      () => repository.getFDCFoodsByString(
        'chic-fil-a sandwich',
        dataTypes: FDCConst.brandedDataTypes,
      ),
    ).thenAnswer((_) async => [branded]);

    final results = await useCase.searchBrandedFoods('chic-fil-a sandwich');

    expect(results.single.name, 'Chick-fil-A Chicken Sandwich');
  });

  test('fails when every source fails', () async {
    when(
      () => repository.getOFFProductsByString('apple'),
    ).thenThrow(Exception('OFF unavailable'));
    when(
      () => repository.getFDCFoodsByString(
        'apple',
        dataTypes: FDCConst.brandedDataTypes,
      ),
    ).thenThrow(Exception('FDC unavailable'));

    expect(
      () => useCase.searchBrandedFoods('apple'),
      throwsA(isA<Exception>()),
    );
  });

  test('times out a slow source without discarding a fast one', () async {
    final useCase = SearchProductsUseCase(
      repository,
      sourceTimeout: const Duration(milliseconds: 20),
    );
    final never = Completer<List<MealEntity>>();
    final branded = _meal(
      name: 'Chick-fil-A Chicken Sandwich',
      brands: 'Chick-fil-A',
      source: MealSourceEntity.fdc,
    );
    when(
      () => repository.getOFFProductsByString('chic-fil-a sandwich'),
    ).thenAnswer((_) => never.future);
    when(
      () => repository.getFDCFoodsByString(
        'chic-fil-a sandwich',
        dataTypes: FDCConst.brandedDataTypes,
      ),
    ).thenAnswer((_) async => [branded]);

    final results = await useCase.searchBrandedFoods('chic-fil-a sandwich');

    expect(results.single.name, 'Chick-fil-A Chicken Sandwich');
  });

  test('ranks per-source results before returning them', () async {
    final weak = _meal(name: 'Apple juice cocktail');
    final strong = _meal(name: 'Apple');
    when(
      () => repository.getOFFProductsByString('apple'),
    ).thenAnswer((_) async => [weak, strong]);

    final results = await useCase.searchOFFProductsByString('apple');

    expect(results.first.name, 'Apple');
  });
}

MealEntity _meal({
  required String name,
  String? brands,
  MealSourceEntity source = MealSourceEntity.off,
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
    nutriments: MealNutrimentsEntity.empty(),
    source: source,
  );
}
