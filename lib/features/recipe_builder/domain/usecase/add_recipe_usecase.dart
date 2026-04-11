import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart';

class AddRecipeUsecase {
  final RecipeRepository _repository;

  AddRecipeUsecase(this._repository);

  Future<void> addRecipe(RecipeEntity recipe) => _repository.addRecipe(recipe);
}
