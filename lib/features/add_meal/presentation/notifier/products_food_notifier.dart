import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';

import 'package:nutriq/features/add_meal/presentation/notifier/food_search_state.dart';

class ProductsNotifier extends Notifier<FoodSearchState> {
  final _log = Logger('ProductsNotifier');
  String _searchString = '';
  Set<AllergenType> _userAllergens = {};
  int _searchRequestId = 0;

  @override
  FoodSearchState build() {
    return const FoodSearchInitial();
  }

  Future<void> searchProducts(String searchString) async {
    if (searchString == _searchString && state is! FoodSearchFailed) return;
    _searchString = searchString;
    final requestId = ++_searchRequestId;
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchOFFProductsByString(searchString);
      if (requestId != _searchRequestId) return;
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      if (requestId != _searchRequestId) return;
      _userAllergens = config.userAllergens;
      final filtered = _userAllergens.isNotEmpty
          ? ref
                .read(allergenFilterServiceProvider)
                .filterByAllergens(result, _userAllergens)
          : result;
      state = FoodSearchLoaded(
        items: filtered,
        usesImperialUnits: config.usesImperialUnits,
        allergensFiltered: _userAllergens.isNotEmpty,
      );
    } catch (error) {
      if (requestId != _searchRequestId) return;
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }

  Future<void> refreshProducts() async {
    final requestId = ++_searchRequestId;
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchOFFProductsByString(_searchString);
      if (requestId != _searchRequestId) return;
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      if (requestId != _searchRequestId) return;
      _userAllergens = config.userAllergens;
      final filtered = _userAllergens.isNotEmpty
          ? ref
                .read(allergenFilterServiceProvider)
                .filterByAllergens(result, _userAllergens)
            : result;
      state = FoodSearchLoaded(
        items: filtered,
        usesImperialUnits: config.usesImperialUnits,
        allergensFiltered: _userAllergens.isNotEmpty,
      );
    } catch (error) {
      if (requestId != _searchRequestId) return;
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }
}

final productsNotifierProvider =
    NotifierProvider<ProductsNotifier, FoodSearchState>(ProductsNotifier.new);

class FoodNotifier extends Notifier<FoodSearchState> {
  final _log = Logger('FoodNotifier');
  String _searchString = '';
  Set<AllergenType> _userAllergens = {};
  int _searchRequestId = 0;

  @override
  FoodSearchState build() {
    return const FoodSearchInitial();
  }

  Future<void> searchFood(String searchString) async {
    if (searchString == _searchString && state is! FoodSearchFailed) return;
    _searchString = searchString;
    final requestId = ++_searchRequestId;
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchFDCFoodByString(searchString);
      if (requestId != _searchRequestId) return;
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      if (requestId != _searchRequestId) return;
      _userAllergens = config.userAllergens;
      final filtered = _userAllergens.isNotEmpty
          ? ref
                .read(allergenFilterServiceProvider)
                .filterByAllergens(result, _userAllergens)
          : result;
      state = FoodSearchLoaded(
        items: filtered,
        usesImperialUnits: config.usesImperialUnits,
        allergensFiltered: _userAllergens.isNotEmpty,
      );
    } catch (error) {
      if (requestId != _searchRequestId) return;
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }

  Future<void> refreshFood() async {
    final requestId = ++_searchRequestId;
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchFDCFoodByString(_searchString);
      if (requestId != _searchRequestId) return;
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      if (requestId != _searchRequestId) return;
      _userAllergens = config.userAllergens;
      final filtered = _userAllergens.isNotEmpty
          ? ref
                .read(allergenFilterServiceProvider)
                .filterByAllergens(result, _userAllergens)
            : result;
      state = FoodSearchLoaded(
        items: filtered,
        usesImperialUnits: config.usesImperialUnits,
        allergensFiltered: _userAllergens.isNotEmpty,
      );
    } catch (error) {
      if (requestId != _searchRequestId) return;
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }
}

final foodNotifierProvider = NotifierProvider<FoodNotifier, FoodSearchState>(
  FoodNotifier.new,
);
