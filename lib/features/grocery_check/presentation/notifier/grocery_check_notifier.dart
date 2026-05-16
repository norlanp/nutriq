import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/grocery_check/presentation/notifier/grocery_check_state.dart';

class GroceryCheckNotifier extends Notifier<GroceryCheckState> {
  @override
  GroceryCheckState build() => const GroceryCheckState();

  Future<void> scanProduct(String barcode) async {
    state = GroceryCheckState(
      status: GroceryCheckStatus.loading,
      items: state.items,
      isLoading: true,
    );
    try {
      final item = await ref.read(groceryCheckServiceProvider).scanBarcode(barcode);
      final updatedItems = [...state.items, item];
      state = GroceryCheckState(status: GroceryCheckStatus.loaded, items: updatedItems);
    } catch (e) {
      state = GroceryCheckState(
        status: GroceryCheckStatus.error,
        items: state.items,
        errorMessage: e.toString(),
      );
    }
  }

  void compareProducts(int firstIndex, int secondIndex) {
    if (state.items.length < 2) return;
    state = GroceryCheckState(
      status: GroceryCheckStatus.comparison,
      items: state.items,
      comparisonFirstIndex: firstIndex,
      comparisonSecondIndex: secondIndex,
    );
  }

  void clearList() {
    state = const GroceryCheckState();
  }

  void removeProduct(int index) {
    final updatedItems = [...state.items]..removeAt(index);
    if (updatedItems.isEmpty) {
      state = const GroceryCheckState();
    } else {
      state = GroceryCheckState(status: GroceryCheckStatus.loaded, items: updatedItems);
    }
  }
}

final groceryCheckNotifierProvider =
    NotifierProvider<GroceryCheckNotifier, GroceryCheckState>(GroceryCheckNotifier.new);