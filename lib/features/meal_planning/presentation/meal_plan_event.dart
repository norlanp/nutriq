part of 'meal_plan_bloc.dart';

abstract class MealPlanEvent extends Equatable {
  const MealPlanEvent();

  @override
  List<Object?> get props => [];
}

class LoadWeek extends MealPlanEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadWeek({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}

class AddMealToSlot extends MealPlanEvent {
  final MealPlanEntity entity;

  const AddMealToSlot({required this.entity});

  @override
  List<Object?> get props => [entity];
}

class RemoveMealFromSlot extends MealPlanEvent {
  final int id;

  const RemoveMealFromSlot({required this.id});

  @override
  List<Object?> get props => [id];
}

class GenerateShoppingList extends MealPlanEvent {
  final DateTime startDate;
  final DateTime endDate;

  const GenerateShoppingList({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}
