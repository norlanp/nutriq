import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/features/add_meal/data/data_sources/fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/off_data_source.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_word_response_dto.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

class MockFDCDataSource extends Mock implements FDCDataSource {}

class MockOFFDataSource extends Mock implements OFFDataSource {}

void main() {
  late MockFDCDataSource fdcDataSource;
  late MockOFFDataSource offDataSource;
  late ProductsRepository repository;

  setUp(() {
    fdcDataSource = MockFDCDataSource();
    offDataSource = MockOFFDataSource();
    repository = ProductsRepository(offDataSource, fdcDataSource);
  });

  test('maps FDC search results to FDC meals', () async {
    when(() => fdcDataSource.fetchSearchWordResults('apple')).thenAnswer(
      (_) async => FDCWordResponseDTO(
        totalHits: 1,
        currentPage: 1,
        foods: [
          FDCFoodDTO(
            fdcId: 123,
            gtinUpc: null,
            description: 'Apple',
            brandOwner: null,
            brandName: null,
            packageWeight: null,
            servingSize: null,
            servingSizeUnit: null,
            foodNutrients: const [],
          ),
        ],
      ),
    );

    final meals = await repository.getFDCFoodsByString('apple');

    expect(meals.single.code, '123');
    expect(meals.single.source, MealSourceEntity.fdc);
  });

  test('returns mapped OFF search results', () async {
    final offMeal = MealEntity(
      code: '123',
      name: 'Apple',
      url: null,
      mealQuantity: null,
      mealUnit: 'g',
      servingQuantity: null,
      servingUnit: 'g',
      servingSize: null,
      nutriments: MealNutrimentsEntity.empty(),
      source: MealSourceEntity.off,
    );
    when(
      () => offDataSource.searchProducts('apple'),
    ).thenAnswer((_) async => [offMeal]);

    final meals = await repository.getOFFProductsByString('apple');

    expect(meals, [offMeal]);
  });

  test('propagates FDC retrieval failures', () async {
    when(
      () => fdcDataSource.fetchSearchWordResults('apple'),
    ).thenThrow(Exception('FDC unavailable'));

    expect(
      () => repository.getFDCFoodsByString('apple'),
      throwsA(isA<Exception>()),
    );
  });

  test('propagates OFF retrieval failures', () async {
    when(
      () => offDataSource.searchProducts('apple'),
    ).thenThrow(Exception('OFF unavailable'));

    expect(
      () => repository.getOFFProductsByString('apple'),
      throwsA(isA<Exception>()),
    );
  });
}
