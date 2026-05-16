import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/presentation/notifier/recipe_state.dart';

class RecipeNotifier extends AsyncNotifier<RecipeState> {
  @override
  Future<RecipeState> build() async {
    return _loadRecipes();
  }

  Future<RecipeState> _loadRecipes() async {
    final recipes = await ref.read(getRecipesUsecaseProvider).getAllRecipes();
    return RecipeState(recipes: recipes);
  }

  Future<void> loadRecipes() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadRecipes());
  }

  Future<void> addRecipe(RecipeEntity recipe) async {
    await ref.read(addRecipeUsecaseProvider).addRecipe(recipe);
    await loadRecipes();
  }

  Future<void> deleteRecipe(String recipeId) async {
    await ref.read(deleteRecipeUsecaseProvider).deleteRecipe(recipeId);
    await loadRecipes();
  }
}

final recipeNotifierProvider =
    AsyncNotifierProvider<RecipeNotifier, RecipeState>(RecipeNotifier.new);