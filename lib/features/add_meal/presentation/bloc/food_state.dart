part of 'food_bloc.dart';

abstract class FoodState extends Equatable {
  const FoodState();
}

class FoodInitial extends FoodState {
  @override
  List<Object> get props => [];
}

class FoodLoadingState extends FoodState {
  @override
  List<Object?> get props => [];
}

class FoodLoadedState extends FoodState {
  final List<MealEntity> food;
  final bool usesImperialUnits;
  final bool allergensFiltered;

  const FoodLoadedState(
      {required this.food,
      this.usesImperialUnits = false,
      this.allergensFiltered = false});

  @override
  List<Object?> get props => [food, allergensFiltered];
}

class FoodFailedState extends FoodState {
  @override
  List<Object?> get props => [];
}
