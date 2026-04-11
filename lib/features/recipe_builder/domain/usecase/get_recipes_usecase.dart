import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart';

class GetRecipesUsecase {
  final RecipeRepository _repository;

  GetRecipesUsecase(this._repository);

  Future<List<RecipeEntity>> getAllRecipes() => _repository.getAllRecipes();

  Future<RecipeEntity?> getRecipeById(String recipeId) =>
      _repository.getRecipeById(recipeId);
}
