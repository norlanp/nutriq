part of 'grocery_check_bloc.dart';

abstract class GroceryCheckEvent extends Equatable {
  const GroceryCheckEvent();

  @override
  List<Object?> get props => [];
}

class GroceryCheckScanProduct extends GroceryCheckEvent {
  final String barcode;

  const GroceryCheckScanProduct({required this.barcode});

  @override
  List<Object?> get props => [barcode];
}

class GroceryCheckCompareProducts extends GroceryCheckEvent {
  final int firstIndex;
  final int secondIndex;

  const GroceryCheckCompareProducts({
    required this.firstIndex,
    required this.secondIndex,
  });

  @override
  List<Object?> get props => [firstIndex, secondIndex];
}

class GroceryCheckClearList extends GroceryCheckEvent {
  const GroceryCheckClearList();
}

class GroceryCheckRemoveProduct extends GroceryCheckEvent {
  final int index;

  const GroceryCheckRemoveProduct({required this.index});

  @override
  List<Object?> get props => [index];
}
