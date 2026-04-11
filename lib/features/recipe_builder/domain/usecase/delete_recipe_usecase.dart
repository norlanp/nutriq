import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart';

class DeleteRecipeUsecase {
  final RecipeRepository _repository;

  DeleteRecipeUsecase(this._repository);

  Future<void> deleteRecipe(String recipeId) =>
      _repository.deleteRecipe(recipeId);
}
