part of 'recipe_catalog_bloc.dart';

abstract class RecipeCatalogEvent extends Equatable {
  const RecipeCatalogEvent();

  @override
  List<Object?> get props => [];
}

class LoadCatalog extends RecipeCatalogEvent {
  const LoadCatalog();
}

class SearchCatalog extends RecipeCatalogEvent {
  final String query;

  const SearchCatalog(this.query);

  @override
  List<Object?> get props => [query];
}

class FilterByTag extends RecipeCatalogEvent {
  final String tag;

  const FilterByTag(this.tag);

  @override
  List<Object?> get props => [tag];
}

class LoadRecipe extends RecipeCatalogEvent {
  final String recipeId;

  const LoadRecipe(this.recipeId);

  @override
  List<Object?> get props => [recipeId];
}
