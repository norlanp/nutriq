import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/meal_plan_dao.dart';

class MealPlanDataSource {
  final MealPlanDao _dao;

  MealPlanDataSource(this._dao);

  Future<int> addPlan(MealPlansCompanion entry) => _dao.addPlan(entry);

  Future<void> deletePlan(int id) => _dao.deletePlan(id);

  Future<List<MealPlan>> getByWeek(DateTime startDate, DateTime endDate) =>
      _dao.getByWeek(startDate, endDate);

  Future<List<MealPlan>> getByDate(DateTime date) => _dao.getByDate(date);

  Future<List<RecipeItemWithMeal>> getRecipeItemsForDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getRecipeItemsForDateRange(startDate, endDate);
}
