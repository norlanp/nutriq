import 'package:equatable/equatable.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

sealed class FoodSearchState extends Equatable {
  const FoodSearchState();
  @override
  List<Object?> get props => [];
}

class FoodSearchInitial extends FoodSearchState {
  const FoodSearchInitial();
}

class FoodSearchLoading extends FoodSearchState {
  const FoodSearchLoading();
}

class FoodSearchLoaded extends FoodSearchState {
  final List<MealEntity> items;
  final bool usesImperialUnits;
  final bool allergensFiltered;

  const FoodSearchLoaded({
    required this.items,
    this.usesImperialUnits = false,
    this.allergensFiltered = false,
  });

  @override
  List<Object?> get props => [items, usesImperialUnits, allergensFiltered];
}

class FoodSearchFailed extends FoodSearchState {
  const FoodSearchFailed();
}