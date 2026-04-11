import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';

abstract class RecipeRepository {
  Future<void> addRecipe(RecipeEntity recipe);
  Future<void> deleteRecipe(String recipeId);
  Future<List<RecipeEntity>> getAllRecipes();
  Future<RecipeEntity?> getRecipeById(String recipeId);
}
