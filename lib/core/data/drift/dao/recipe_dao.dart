import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/recipe_table.dart';
import 'package:nutriq/core/data/drift/tables/meal_table.dart';

part 'recipe_dao.g.dart';

@DriftAccessor(tables: [Recipes, RecipeItems, Meals])
class RecipeDao extends DatabaseAccessor<AppDatabase> with _$RecipeDaoMixin {
  RecipeDao(super.db);

  Future<void> addRecipe(RecipesCompanion recipe) async {
    await into(recipes).insert(recipe);
  }

  Future<void> addRecipeItems(List<RecipeItemsCompanion> items) async {
    await batch((b) {
      b.insertAll(recipeItems, items);
    });
  }

  Future<void> deleteRecipe(String recipeId) async {
    await (delete(recipeItems)..where((t) => t.recipeId.equals(recipeId))).go();
    await (delete(recipes)..where((t) => t.id.equals(recipeId))).go();
  }

  Future<void> updateRecipe(RecipesCompanion recipe) async {
    await (update(recipes)..where((t) => t.id.equals(recipe.id.value))).write(
      RecipesCompanion(
        name: recipe.name,
        servings: recipe.servings,
        updatedAt: Value(DateTime.now()),
      ),
    );
  }

  Future<void> deleteRecipeItemsForRecipe(String recipeId) async {
    await (delete(recipeItems)..where((t) => t.recipeId.equals(recipeId))).go();
  }

  Future<Recipe?> getRecipeById(String recipeId) async {
    return await (select(recipes)..where((t) => t.id.equals(recipeId)))
        .getSingleOrNull();
  }

  Future<List<Recipe>> getAllRecipes() async {
    return await (select(recipes)
          ..orderBy([(t) => OrderingTerm.desc(t.updatedAt)]))
        .get();
  }

  Future<List<RecipeItem>> getRecipeItems(String recipeId) async {
    return await (select(recipeItems)
          ..where((t) => t.recipeId.equals(recipeId)))
        .get();
  }

  Future<List<RecipeItemWithMeal>> getRecipeItemsWithMeals(
      String recipeId) async {
    final query = select(recipeItems).join([
      innerJoin(meals, meals.id.equalsExp(recipeItems.mealId)),
    ])
      ..where(recipeItems.recipeId.equals(recipeId));

    final rows = await query.get();
    return rows
        .map((row) => RecipeItemWithMeal(
              recipeItem: row.readTable(recipeItems),
              meal: row.readTable(meals),
            ))
        .toList();
  }

  Future<void> updateRecipeItemAmount(String itemId, double amount) async {
    await (update(recipeItems)..where((t) => t.id.equals(itemId))).write(
      RecipeItemsCompanion(amount: Value(amount)),
    );
  }
}

class RecipeItemWithMeal {
  final RecipeItem recipeItem;
  final Meal meal;

  RecipeItemWithMeal({required this.recipeItem, required this.meal});
}
