part of 'grocery_check_bloc.dart';

abstract class GroceryCheckState extends Equatable {
  final List<GroceryCheckItem> items;

  const GroceryCheckState(this.items);

  @override
  List<Object?> get props => [items];
}

class GroceryCheckInitial extends GroceryCheckState {
  const GroceryCheckInitial() : super(const []);
}

class GroceryCheckLoading extends GroceryCheckState {
  const GroceryCheckLoading(super.items);
}

class GroceryCheckLoaded extends GroceryCheckState {
  const GroceryCheckLoaded(super.items);
}

class GroceryCheckError extends GroceryCheckState {
  final String message;

  const GroceryCheckError(super.items, this.message);

  @override
  List<Object?> get props => [items, message];
}

class GroceryCheckComparison extends GroceryCheckState {
  final int firstIndex;
  final int secondIndex;

  const GroceryCheckComparison(
    super.items,
    this.firstIndex,
    this.secondIndex,
  );

  @override
  List<Object?> get props => [items, firstIndex, secondIndex];
}
