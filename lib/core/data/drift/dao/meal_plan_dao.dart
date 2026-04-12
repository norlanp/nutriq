import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/meal_plan_table.dart';
import 'package:nutriq/core/data/drift/tables/recipe_table.dart';
import 'package:nutriq/core/data/drift/tables/meal_table.dart';

part 'meal_plan_dao.g.dart';

@DriftAccessor(tables: [MealPlans, Recipes, RecipeItems, Meals])
class MealPlanDao extends DatabaseAccessor<AppDatabase>
    with _$MealPlanDaoMixin {
  MealPlanDao(super.db);

  Future<int> addPlan(MealPlansCompanion entry) =>
      into(mealPlans).insert(entry);

  Future<void> deletePlan(int id) =>
      (delete(mealPlans)..where((t) => t.id.equals(id))).go();

  Future<List<MealPlan>> getByWeek(DateTime startDate, DateTime endDate) =>
      (select(mealPlans)
            ..where((t) =>
                t.date.isBiggerOrEqualValue(startDate) &
                t.date.isSmallerOrEqualValue(endDate))
            ..orderBy([(t) => OrderingTerm.asc(t.date)]))
          .get();

  Future<List<MealPlan>> getByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(mealPlans)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerThanValue(end)))
        .get();
  }

  Future<List<RecipeItemWithMeal>> getRecipeItemsForDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final plans = await getByWeek(startDate, endDate);
    final recipeIds =
        plans.where((p) => p.recipeId != null).map((p) => p.recipeId!).toList();

    if (recipeIds.isEmpty) return [];

    final results = <RecipeItemWithMeal>[];
    for (final recipeId in recipeIds) {
      final query = select(recipeItems).join([
        innerJoin(meals, meals.id.equalsExp(recipeItems.mealId)),
      ])
        ..where(recipeItems.recipeId.equals(recipeId));

      final rows = await query.get();
      results.addAll(
        rows.map((row) => RecipeItemWithMeal(
              recipeItem: row.readTable(recipeItems),
              meal: row.readTable(meals),
            )),
      );
    }
    return results;
  }
}

class RecipeItemWithMeal {
  final RecipeItem recipeItem;
  final Meal meal;

  RecipeItemWithMeal({required this.recipeItem, required this.meal});
}
