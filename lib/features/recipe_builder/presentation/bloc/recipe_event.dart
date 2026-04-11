part of 'recipe_bloc.dart';

abstract class RecipeEvent extends Equatable {
  const RecipeEvent();

  @override
  List<Object?> get props => [];
}

class LoadRecipesEvent extends RecipeEvent {}

class AddRecipeEvent extends RecipeEvent {
  final RecipeEntity recipe;

  const AddRecipeEvent(this.recipe);

  @override
  List<Object?> get props => [recipe];
}

class DeleteRecipeEvent extends RecipeEvent {
  final String recipeId;

  const DeleteRecipeEvent(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}
