part of 'recipe_catalog_bloc.dart';

abstract class RecipeCatalogState extends Equatable {
  const RecipeCatalogState();

  @override
  List<Object?> get props => [];
}

class RecipeCatalogInitial extends RecipeCatalogState {
  const RecipeCatalogInitial();
}

class RecipeCatalogLoading extends RecipeCatalogState {
  const RecipeCatalogLoading();
}

class RecipeCatalogLoaded extends RecipeCatalogState {
  final List<CatalogRecipeEntity> recipes;
  final List<CatalogRecipeEntity> filteredRecipes;
  final List<String> availableTags;
  final String? activeTag;
  final String searchQuery;

  const RecipeCatalogLoaded({
    required this.recipes,
    required this.filteredRecipes,
    required this.availableTags,
    required this.activeTag,
    required this.searchQuery,
  });

  @override
  List<Object?> get props => [
        recipes,
        filteredRecipes,
        availableTags,
        activeTag,
        searchQuery,
      ];
}

class RecipeDetailLoaded extends RecipeCatalogState {
  final CatalogRecipeEntity recipe;

  const RecipeDetailLoaded({required this.recipe});

  @override
  List<Object?> get props => [recipe];
}

class RecipeCatalogError extends RecipeCatalogState {
  final String message;

  const RecipeCatalogError(this.message);

  @override
  List<Object?> get props => [message];
}
