part of 'recipe_import_bloc.dart';

abstract class RecipeImportState extends Equatable {
  const RecipeImportState();

  @override
  List<Object?> get props => [];
}

class RecipeImportInitial extends RecipeImportState {
  const RecipeImportInitial();
}

class RecipeImportLoading extends RecipeImportState {
  const RecipeImportLoading();
}

class RecipeImportPreview extends RecipeImportState {
  final ScrapedRecipeEntity recipe;

  const RecipeImportPreview(this.recipe);

  @override
  List<Object?> get props => [recipe];
}

class RecipeImportSuccess extends RecipeImportState {
  const RecipeImportSuccess();
}

class RecipeImportError extends RecipeImportState {
  final String message;

  const RecipeImportError(this.message);

  @override
  List<Object?> get props => [message];
}
