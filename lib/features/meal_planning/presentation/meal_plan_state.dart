part of 'meal_plan_bloc.dart';

abstract class MealPlanState extends Equatable {
  const MealPlanState();

  @override
  List<Object?> get props => [];
}

class MealPlanInitial extends MealPlanState {}

class MealPlanLoading extends MealPlanState {}

class MealPlanLoaded extends MealPlanState {
  final List<MealPlanEntity> plans;

  const MealPlanLoaded({required this.plans});

  @override
  List<Object?> get props => [plans];
}

class ShoppingListLoaded extends MealPlanState {
  final List<ShoppingListItem> items;

  const ShoppingListLoaded({required this.items});

  @override
  List<Object?> get props => [items];
}

class MealPlanError extends MealPlanState {
  final String message;

  const MealPlanError(this.message);

  @override
  List<Object?> get props => [message];
}
