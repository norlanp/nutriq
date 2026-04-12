import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';

abstract class MealPlanRepository {
  Future<void> addPlan(MealPlanEntity entity);
  Future<void> deletePlan(int id);
  Future<List<MealPlanEntity>> getByWeek(DateTime startDate, DateTime endDate);
  Future<List<MealPlanEntity>> getByDate(DateTime date);
  Future<List<ShoppingListItem>> getShoppingList(
      DateTime startDate, DateTime endDate);
}

class ShoppingListItem {
  final String name;
  final double totalAmount;
  final String unit;

  const ShoppingListItem({
    required this.name,
    required this.totalAmount,
    required this.unit,
  });
}
