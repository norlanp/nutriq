import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';

import 'package:nutriq/features/add_meal/presentation/notifier/food_search_state.dart';

class ProductsNotifier extends Notifier<FoodSearchState> {
  final _log = Logger('ProductsNotifier');
  String _searchString = '';
  Set<AllergenType> _userAllergens = {};

  @override
  FoodSearchState build() {
    return const FoodSearchInitial();
  }

  Future<void> searchProducts(String searchString) async {
    if (searchString == _searchString) return;
    _searchString = searchString;
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchOFFProductsByString(_searchString);
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
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
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }

  Future<void> refreshProducts() async {
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchOFFProductsByString(_searchString);
      final filtered = _userAllergens.isNotEmpty
          ? ref
              .read(allergenFilterServiceProvider)
              .filterByAllergens(result, _userAllergens)
          : result;
      state = FoodSearchLoaded(
        items: filtered,
        usesImperialUnits: state is FoodSearchLoaded
            ? (state as FoodSearchLoaded).usesImperialUnits
            : false,
        allergensFiltered: _userAllergens.isNotEmpty,
      );
    } catch (error) {
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }
}

final productsNotifierProvider =
    NotifierProvider<ProductsNotifier, FoodSearchState>(
        ProductsNotifier.new);

class FoodNotifier extends Notifier<FoodSearchState> {
  final _log = Logger('FoodNotifier');
  String _searchString = '';
  Set<AllergenType> _userAllergens = {};

  @override
  FoodSearchState build() {
    return const FoodSearchInitial();
  }

  Future<void> searchFood(String searchString) async {
    if (searchString == _searchString) return;
    _searchString = searchString;
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchFDCFoodByString(_searchString);
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
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
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }

  Future<void> refreshFood() async {
    state = const FoodSearchLoading();
    try {
      final result = await ref
          .read(searchProductsUseCaseProvider)
          .searchFDCFoodByString(_searchString);
      final filtered = _userAllergens.isNotEmpty
          ? ref
              .read(allergenFilterServiceProvider)
              .filterByAllergens(result, _userAllergens)
          : result;
      state = FoodSearchLoaded(
        items: filtered,
        usesImperialUnits: state is FoodSearchLoaded
            ? (state as FoodSearchLoaded).usesImperialUnits
            : false,
        allergensFiltered: _userAllergens.isNotEmpty,
      );
    } catch (error) {
      _log.severe(error);
      state = const FoodSearchFailed();
    }
  }
}

final foodNotifierProvider = NotifierProvider<FoodNotifier, FoodSearchState>(
    FoodNotifier.new);