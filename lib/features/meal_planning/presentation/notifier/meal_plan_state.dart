import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';

class MealPlanState extends Equatable {
  final List<MealPlanEntity> plans;
  final List<ShoppingListItem> shoppingItems;
  final bool isLoading;
  final String? errorMessage;

  const MealPlanState({
    this.plans = const [],
    this.shoppingItems = const [],
    this.isLoading = false,
    this.errorMessage,
  });

  bool get isPlansLoaded => plans.isNotEmpty;
  bool get isShoppingListLoaded => shoppingItems.isNotEmpty;
  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [plans, shoppingItems, isLoading, errorMessage];
}