import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/service/allergen_filter_service.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final log = Logger('ProductsBloc');

  final SearchProductsUseCase _searchProductUseCase;
  final GetConfigUsecase _getConfigUsecase;
  final AllergenFilterService _allergenFilterService;

  String _searchString = "";
  Set<AllergenType> _userAllergens = {};

  ProductsBloc(
    this._searchProductUseCase,
    this._getConfigUsecase,
    this._allergenFilterService,
  ) : super(ProductsInitial()) {
    on<LoadProductsEvent>((event, emit) async {
      if (event.searchString != _searchString) {
        _searchString = event.searchString;
        emit(ProductsLoadingState());
        try {
          final result = await _searchProductUseCase
              .searchOFFProductsByString(_searchString);
          final config = await _getConfigUsecase.getConfig();
          _userAllergens = config.userAllergens;

          final filtered = _userAllergens.isNotEmpty
              ? _allergenFilterService.filterByAllergens(result, _userAllergens)
              : result;

          emit(ProductsLoadedState(
              products: filtered,
              usesImperialUnits: config.usesImperialUnits,
              allergensFiltered: _userAllergens.isNotEmpty));
        } catch (error) {
          log.severe(error);
          emit(ProductsFailedState());
        }
      }
    });
    on<RefreshProductsEvent>((event, emit) async {
      emit(ProductsLoadingState());
      try {
        final result = await _searchProductUseCase
            .searchOFFProductsByString(_searchString);
        final filtered = _userAllergens.isNotEmpty
            ? _allergenFilterService.filterByAllergens(result, _userAllergens)
            : result;
        emit(ProductsLoadedState(
            products: filtered, allergensFiltered: _userAllergens.isNotEmpty));
      } catch (error) {
        log.severe(error);
        emit(ProductsFailedState());
      }
    });
  }
}
