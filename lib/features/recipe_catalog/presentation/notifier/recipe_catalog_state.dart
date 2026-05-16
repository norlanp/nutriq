import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/catalog_recipe_entity.dart';

class RecipeCatalogState extends Equatable {
  final List<CatalogRecipeEntity> recipes;
  final List<CatalogRecipeEntity> filteredRecipes;
  final List<String> availableTags;
  final String? activeTag;
  final String searchQuery;
  final String? errorMessage;
  final CatalogRecipeEntity? selectedRecipe;

  const RecipeCatalogState({
    this.recipes = const [],
    this.filteredRecipes = const [],
    this.availableTags = const [],
    this.activeTag,
    this.searchQuery = '',
    this.errorMessage,
    this.selectedRecipe,
  });

  bool get isLoading => recipes.isEmpty && errorMessage == null && selectedRecipe == null;
  bool get hasError => errorMessage != null;
  bool get isLoaded => recipes.isNotEmpty;
  bool get isDetailLoaded => selectedRecipe != null;

  @override
  List<Object?> get props => [recipes, filteredRecipes, availableTags, activeTag, searchQuery, errorMessage, selectedRecipe];
}