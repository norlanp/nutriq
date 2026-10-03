import 'package:logging/logging.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/service/food_search_ranker.dart';

class SearchProductsUseCase {
  final log = Logger('SearchProductsUseCase');
  final ProductsRepository _productsRepository;
  final FoodSearchRanker _ranker;
  final Duration _sourceTimeout;

  SearchProductsUseCase(
    this._productsRepository, {
    FoodSearchRanker ranker = const FoodSearchRanker(),
    Duration sourceTimeout = const Duration(seconds: 20),
  })  : _ranker = ranker,
        _sourceTimeout = sourceTimeout;

  Future<List<MealEntity>> searchOFFProductsByString(
    String searchString,
  ) async {
    final products = await _productsRepository.getOFFProductsByString(
      searchString,
    );
    return _ranker.rank(products, searchString);
  }

  Future<List<MealEntity>> searchFDCFoodByString(String searchString) async {
    final foods = await _productsRepository.getFDCFoodsByString(searchString);
    return _ranker.rank(foods, searchString);
  }

  /// Searches branded foods across every public source and returns one ranked
  /// list. A single failing source does not discard the others; the search
  /// only fails when every source fails.
  Future<List<MealEntity>> searchBrandedFoods(String searchString) async {
    final results = await Future.wait([
      _fetchSafely(
        'Open Food Facts',
        () => _productsRepository.getOFFProductsByString(searchString),
      ),
      _fetchSafely(
        'USDA Branded',
        () => _productsRepository.getFDCFoodsByString(
          searchString,
          dataTypes: FDCConst.brandedDataTypes,
        ),
      ),
    ]);

    if (results.every((result) => result.error != null)) {
      throw results.first.error!;
    }

    final merged = results.expand((result) => result.meals).toList();
    return _ranker.rank(merged, searchString);
  }

  Future<_SourceResult> _fetchSafely(
    String source,
    Future<List<MealEntity>> Function() fetch,
  ) async {
    try {
      return _SourceResult(meals: await fetch().timeout(_sourceTimeout));
    } catch (exception, stackTrace) {
      log.warning('Food source "$source" failed', exception, stackTrace);
      return _SourceResult(error: exception);
    }
  }
}

class _SourceResult {
  final List<MealEntity> meals;
  final Object? error;

  _SourceResult({this.meals = const [], this.error});
}
