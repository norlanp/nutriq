import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';

class RecipeDataSource {
  final RecipeDao _dao;

  RecipeDataSource(this._dao);

  Future<void> addRecipe(RecipesCompanion recipe) => _dao.addRecipe(recipe);

  Future<void> addRecipeItems(List<RecipeItemsCompanion> items) =>
      _dao.addRecipeItems(items);

  Future<void> deleteRecipe(String recipeId) => _dao.deleteRecipe(recipeId);

  Future<void> updateRecipe(RecipesCompanion recipe) =>
      _dao.updateRecipe(recipe);

  Future<void> deleteRecipeItemsForRecipe(String recipeId) =>
      _dao.deleteRecipeItemsForRecipe(recipeId);

  Future<void> addRecipeItemsForRecipe(
      String recipeId, List<RecipeItemsCompanion> items) async {
    await _dao.deleteRecipeItemsForRecipe(recipeId);
    await _dao.addRecipeItems(items);
  }

  Future<Recipe?> getRecipeById(String recipeId) =>
      _dao.getRecipeById(recipeId);

  Future<List<Recipe>> getAllRecipes() => _dao.getAllRecipes();

  Future<List<RecipeItemWithMeal>> getRecipeItemsWithMeals(String recipeId) =>
      _dao.getRecipeItemsWithMeals(recipeId);
}
