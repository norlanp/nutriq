import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/catalog_recipe_entity.dart';
import 'package:nutriq/core/domain/service/recipe_catalog_service.dart';

part 'recipe_catalog_event.dart';
part 'recipe_catalog_state.dart';

class RecipeCatalogBloc extends Bloc<RecipeCatalogEvent, RecipeCatalogState> {
  final RecipeCatalogService _catalogService;

  RecipeCatalogBloc(this._catalogService)
      : super(const RecipeCatalogInitial()) {
    on<LoadCatalog>(_onLoadCatalog);
    on<SearchCatalog>(_onSearchCatalog);
    on<FilterByTag>(_onFilterByTag);
    on<LoadRecipe>(_onLoadRecipe);
  }

  List<CatalogRecipeEntity> _allRecipes = [];

  Future<void> _onLoadCatalog(
    LoadCatalog event,
    Emitter<RecipeCatalogState> emit,
  ) async {
    emit(const RecipeCatalogLoading());
    try {
      _allRecipes = await _catalogService.loadCatalog();
      emit(RecipeCatalogLoaded(
        recipes: _allRecipes,
        filteredRecipes: _allRecipes,
        availableTags: _extractTags(_allRecipes),
        activeTag: null,
        searchQuery: '',
      ));
    } catch (e) {
      emit(RecipeCatalogError(e.toString()));
    }
  }

  Future<void> _onSearchCatalog(
    SearchCatalog event,
    Emitter<RecipeCatalogState> emit,
  ) async {
    final state = this.state;
    if (state is! RecipeCatalogLoaded) return;

    final query = event.query.toLowerCase();
    final filtered = _applyFilters(query, state.activeTag);
    emit(RecipeCatalogLoaded(
      recipes: state.recipes,
      filteredRecipes: filtered,
      availableTags: state.availableTags,
      activeTag: state.activeTag,
      searchQuery: event.query,
    ));
  }

  Future<void> _onFilterByTag(
    FilterByTag event,
    Emitter<RecipeCatalogState> emit,
  ) async {
    final state = this.state;
    if (state is! RecipeCatalogLoaded) return;

    final newTag = event.tag == state.activeTag ? null : event.tag;
    final filtered = _applyFilters(state.searchQuery, newTag);
    emit(RecipeCatalogLoaded(
      recipes: state.recipes,
      filteredRecipes: filtered,
      availableTags: state.availableTags,
      activeTag: newTag,
      searchQuery: state.searchQuery,
    ));
  }

  Future<void> _onLoadRecipe(
    LoadRecipe event,
    Emitter<RecipeCatalogState> emit,
  ) async {
    final state = this.state;
    if (state is! RecipeCatalogLoaded) return;

    final recipe = _allRecipes.firstWhere(
      (r) => r.id == event.recipeId,
      orElse: () => throw StateError('Recipe not found'),
    );
    emit(RecipeDetailLoaded(recipe: recipe));
  }

  List<CatalogRecipeEntity> _applyFilters(
    String query,
    String? tag,
  ) {
    var result = _allRecipes;
    if (tag != null) {
      result = result.where((r) => r.tags.contains(tag)).toList();
    }
    if (query.isNotEmpty) {
      result = result
          .where((r) =>
              r.title.toLowerCase().contains(query) ||
              r.description.toLowerCase().contains(query) ||
              r.ingredients.any((i) => i.toLowerCase().contains(query)))
          .toList();
    }
    return result;
  }

  List<String> _extractTags(List<CatalogRecipeEntity> recipes) {
    final tagSet = <String>{};
    for (final r in recipes) {
      tagSet.addAll(r.tags);
    }
    return tagSet.toList()..sort();
  }
}
