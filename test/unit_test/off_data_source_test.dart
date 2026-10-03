import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/features/add_meal/data/data_sources/off_data_source.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class MockDio extends Mock implements Dio {}

void main() {
  setUpAll(() => registerFallbackValue(Uri()));

  test('maps search-a-licious hits into OFF meals', () async {
    final dio = MockDio();
    when(() => dio.getUri(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/search'),
        statusCode: 200,
        data: {
          'hits': [
            {
              'code': '0070200856165',
              'product_name': 'Chick-fil-A Chicken Sandwich',
              'brands': ['Chick-fil-A'],
              'nutriments': {
                'energy-kcal_100g': 228.0,
                'proteins_100g': 12.0,
                'carbohydrates_100g': 20.0,
                'fat_100g': 11.0,
              },
              'image_front_small_url': 'https://images.test/small.jpg',
              'image_front_url': 'https://images.test/full.jpg',
            },
          ],
        },
      ),
    );

    final meals = await OFFDataSource(dio).searchProducts(
      'chick-fil-a sandwich',
    );

    final meal = meals.single;
    expect(meal.code, '0070200856165');
    expect(meal.name, 'Chick-fil-A Chicken Sandwich');
    expect(meal.brands, 'Chick-fil-A');
    expect(meal.nutriments.energyKcal100, 228.0);
    expect(meal.nutriments.proteins100, 12.0);
    expect(meal.thumbnailImageUrl, 'https://images.test/small.jpg');
    expect(meal.source, MealSourceEntity.off);
  });

  test('skips malformed hits instead of failing the search', () async {
    final dio = MockDio();
    when(() => dio.getUri(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/search'),
        statusCode: 200,
        data: {
          'hits': [
            {'code': '123', 'brands': {'unexpected': true}},
            {'code': '456', 'product_name': 'Valid product', 'brands': []},
          ],
        },
      ),
    );

    final meals = await OFFDataSource(dio).searchProducts('anything');

    expect(meals.single.name, 'Valid product');
  });

  test('returns an empty list when the response has no hits', () async {
    final dio = MockDio();
    when(() => dio.getUri(any())).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/search'),
        statusCode: 200,
        data: const <String, dynamic>{},
      ),
    );

    expect(await OFFDataSource(dio).searchProducts('anything'), isEmpty);
  });
}
