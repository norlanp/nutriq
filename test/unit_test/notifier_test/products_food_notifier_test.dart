import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/providers/config_providers.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/food_search_state.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/products_food_notifier.dart';
import 'package:nutriq/features/add_meal/providers/add_meal_providers.dart';

class MockSearchProductsUseCase extends Mock implements SearchProductsUseCase {}

class MockGetConfigUsecase extends Mock implements GetConfigUsecase {}

void main() {
  late MockSearchProductsUseCase searchProductsUseCase;
  late MockGetConfigUsecase getConfigUsecase;
  late ProviderContainer container;

  final config = ConfigEntity(
    hasAcceptedDisclaimer: true,
    hasAcceptedPolicy: true,
    hasAcceptedSendAnonymousData: true,
    appTheme: AppThemeEntity.system,
  );

  setUp(() {
    searchProductsUseCase = MockSearchProductsUseCase();
    getConfigUsecase = MockGetConfigUsecase();
    when(() => getConfigUsecase.getConfig()).thenAnswer((_) async => config);
    container = ProviderContainer(
      overrides: [
        searchProductsUseCaseProvider.overrideWithValue(searchProductsUseCase),
        getConfigUsecaseProvider.overrideWithValue(getConfigUsecase),
      ],
    );
  });

  tearDown(() => container.dispose());

  test('ignores a stale product search response', () async {
    final firstResult = Completer<List<MealEntity>>();
    final secondResult = Completer<List<MealEntity>>();
    when(
      () => searchProductsUseCase.searchOFFProductsByString('first'),
    ).thenAnswer((_) => firstResult.future);
    when(
      () => searchProductsUseCase.searchOFFProductsByString('second'),
    ).thenAnswer((_) => secondResult.future);

    final notifier = container.read(productsNotifierProvider.notifier);
    final firstSearch = notifier.searchProducts('first');
    final secondSearch = notifier.searchProducts('second');
    secondResult.complete([_meal('second')]);
    await secondSearch;
    firstResult.complete([_meal('first')]);
    await firstSearch;

    final state = container.read(productsNotifierProvider);
    expect(state, isA<FoodSearchLoaded>());
    expect((state as FoodSearchLoaded).items.single.code, 'second');
  });

  test('ignores a stale FDC food search response', () async {
    final firstResult = Completer<List<MealEntity>>();
    final secondResult = Completer<List<MealEntity>>();
    when(
      () => searchProductsUseCase.searchFDCFoodByString('first'),
    ).thenAnswer((_) => firstResult.future);
    when(
      () => searchProductsUseCase.searchFDCFoodByString('second'),
    ).thenAnswer((_) => secondResult.future);

    final notifier = container.read(foodNotifierProvider.notifier);
    final firstSearch = notifier.searchFood('first');
    final secondSearch = notifier.searchFood('second');
    secondResult.complete([_meal('second')]);
    await secondSearch;
    firstResult.complete([_meal('first')]);
    await firstSearch;

    final state = container.read(foodNotifierProvider);
    expect(state, isA<FoodSearchLoaded>());
    expect((state as FoodSearchLoaded).items.single.code, 'second');
  });

  test('shows a failed state when product retrieval fails', () async {
    when(
      () => searchProductsUseCase.searchOFFProductsByString('apple'),
    ).thenAnswer((_) async => throw Exception('Search failed'));

    final notifier = container.read(productsNotifierProvider.notifier);
    await notifier.searchProducts('apple');

    expect(container.read(productsNotifierProvider), isA<FoodSearchFailed>());
  });

  test('shows a failed state when FDC food retrieval fails', () async {
    when(
      () => searchProductsUseCase.searchFDCFoodByString('apple'),
    ).thenAnswer((_) async => throw Exception('Search failed'));

    final notifier = container.read(foodNotifierProvider.notifier);
    await notifier.searchFood('apple');

    expect(container.read(foodNotifierProvider), isA<FoodSearchFailed>());
  });

  test('retries a failed product search with the same query', () async {
    when(
      () => searchProductsUseCase.searchOFFProductsByString('apple'),
    ).thenAnswer((_) async => throw Exception('Search failed'));

    final notifier = container.read(productsNotifierProvider.notifier);
    await notifier.searchProducts('apple');
    await notifier.searchProducts('apple');

    verify(
      () => searchProductsUseCase.searchOFFProductsByString('apple'),
    ).called(2);
  });

  test('retries a failed FDC food search with the same query', () async {
    when(
      () => searchProductsUseCase.searchFDCFoodByString('apple'),
    ).thenAnswer((_) async => throw Exception('Search failed'));

    final notifier = container.read(foodNotifierProvider.notifier);
    await notifier.searchFood('apple');
    await notifier.searchFood('apple');

    verify(
      () => searchProductsUseCase.searchFDCFoodByString('apple'),
    ).called(2);
  });

  test('preserves imperial units when refreshing a product search', () async {
    when(
      () => searchProductsUseCase.searchOFFProductsByString('apple'),
    ).thenAnswer((_) async => [_meal('apple')]);
    when(() => getConfigUsecase.getConfig()).thenAnswer(
      (_) async => config.copyWith(usesImperialUnits: true),
    );

    final notifier = container.read(productsNotifierProvider.notifier);
    await notifier.searchProducts('apple');
    await notifier.refreshProducts();

    final state = container.read(productsNotifierProvider) as FoodSearchLoaded;
    expect(state.usesImperialUnits, isTrue);
  });

  test('preserves imperial units when refreshing an FDC food search', () async {
    when(
      () => searchProductsUseCase.searchFDCFoodByString('apple'),
    ).thenAnswer((_) async => [_meal('apple')]);
    when(() => getConfigUsecase.getConfig()).thenAnswer(
      (_) async => config.copyWith(usesImperialUnits: true),
    );

    final notifier = container.read(foodNotifierProvider.notifier);
    await notifier.searchFood('apple');
    await notifier.refreshFood();

    final state = container.read(foodNotifierProvider) as FoodSearchLoaded;
    expect(state.usesImperialUnits, isTrue);
  });
}

MealEntity _meal(String code) => MealEntity(
  code: code,
  name: code,
  url: null,
  mealQuantity: null,
  mealUnit: 'g',
  servingQuantity: null,
  servingUnit: 'g',
  servingSize: null,
  nutriments: MealNutrimentsEntity.empty(),
  source: MealSourceEntity.off,
);
