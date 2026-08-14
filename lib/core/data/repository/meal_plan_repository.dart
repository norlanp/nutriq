import 'package:nutriq/core/data/data_source/meal_plan_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart'
    as domain;

class MealPlanRepository implements domain.MealPlanRepository {
  final MealPlanDataSource _mealPlanDataSource;

  MealPlanRepository(this._mealPlanDataSource);

  @override
  Future<void> addPlan(MealPlanEntity entity) async {
    final companion = mapMealPlanEntityToCompanion(entity);
    await _mealPlanDataSource.addPlan(companion);
  }

  @override
  Future<void> deletePlan(int id) async {
    await _mealPlanDataSource.deletePlan(id);
  }

  @override
  Future<List<MealPlanEntity>> getByWeek(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final rows = await _mealPlanDataSource.getByWeek(startDate, endDate);
    return rows.map(mapMealPlanToEntity).toList();
  }

  @override
  Future<List<MealPlanEntity>> getByDate(DateTime date) async {
    final rows = await _mealPlanDataSource.getByDate(date);
    return rows.map(mapMealPlanToEntity).toList();
  }

  @override
  Future<List<domain.ShoppingListItem>> getShoppingList(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final recipeItems = await _mealPlanDataSource.getRecipeItemsForDateRange(
      startDate,
      endDate,
    );

    final ingredientMap = <String, domain.ShoppingListItem>{};

    for (final item in recipeItems) {
      final name = item.meal.name ?? 'Unknown';
      final amount = item.recipeItem.amount;
      final unit = item.recipeItem.unit;

      final key = '${name}_$unit';
      if (ingredientMap.containsKey(key)) {
        final existing = ingredientMap[key]!;
        ingredientMap[key] = domain.ShoppingListItem(
          name: existing.name,
          totalAmount: existing.totalAmount + amount,
          unit: existing.unit,
        );
      } else {
        ingredientMap[key] = domain.ShoppingListItem(
          name: name,
          totalAmount: amount,
          unit: unit,
        );
      }
    }

    return ingredientMap.values.toList();
  }
}
