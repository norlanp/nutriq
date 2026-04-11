import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/meal_table.dart';

part 'meal_dao.g.dart';

@DriftAccessor(tables: [Meals])
class MealDao extends DatabaseAccessor<AppDatabase> with _$MealDaoMixin {
  MealDao(super.db);

  Future<void> addMeal(MealsCompanion meal) async {
    await into(meals).insertOnConflictUpdate(meal);
  }

  Future<void> addAllMeals(List<MealsCompanion> mealList) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(meals, mealList);
    });
  }

  Future<Meal?> getMealById(String mealId) async {
    return await (select(meals)..where((t) => t.id.equals(mealId)))
        .getSingleOrNull();
  }

  Future<List<Meal>> getAllMeals() async {
    return await select(meals).get();
  }
}
