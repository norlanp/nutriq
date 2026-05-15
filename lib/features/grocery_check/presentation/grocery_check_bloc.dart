import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';

part 'grocery_check_event.dart';
part 'grocery_check_state.dart';

class GroceryCheckBloc extends Bloc<GroceryCheckEvent, GroceryCheckState> {
  final GroceryCheckService _groceryCheckService;

  GroceryCheckBloc(this._groceryCheckService)
      : super(const GroceryCheckInitial()) {
    on<GroceryCheckScanProduct>(_onScanProduct);
    on<GroceryCheckCompareProducts>(_onCompareProducts);
    on<GroceryCheckClearList>(_onClearList);
    on<GroceryCheckRemoveProduct>(_onRemoveProduct);
  }

  Future<void> _onScanProduct(
    GroceryCheckScanProduct event,
    Emitter<GroceryCheckState> emit,
  ) async {
    emit(GroceryCheckLoading(state.items));
    try {
      final item = await _groceryCheckService.scanBarcode(event.barcode);
      final updatedItems = [...state.items, item];
      emit(GroceryCheckLoaded(updatedItems));
    } catch (e) {
      emit(GroceryCheckError(state.items, e.toString()));
    }
  }

  void _onCompareProducts(
    GroceryCheckCompareProducts event,
    Emitter<GroceryCheckState> emit,
  ) {
    if (state.items.length < 2) return;
    emit(GroceryCheckComparison(
      state.items,
      event.firstIndex,
      event.secondIndex,
    ));
  }

  void _onClearList(
    GroceryCheckClearList event,
    Emitter<GroceryCheckState> emit,
  ) {
    emit(const GroceryCheckInitial());
  }

  void _onRemoveProduct(
    GroceryCheckRemoveProduct event,
    Emitter<GroceryCheckState> emit,
  ) {
    final updatedItems = [...state.items]..removeAt(event.index);
    if (updatedItems.isEmpty) {
      emit(const GroceryCheckInitial());
    } else {
      emit(GroceryCheckLoaded(updatedItems));
    }
  }
}
