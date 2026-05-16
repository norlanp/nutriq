import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/catalog_recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/providers/recipe_providers.dart';
import 'package:nutriq/features/recipe_catalog/presentation/notifier/recipe_catalog_state.dart';

class RecipeCatalogNotifier extends Notifier<RecipeCatalogState> {
  @override
  RecipeCatalogState build() {
    _loadCatalog();
    return const RecipeCatalogState();
  }

  List<CatalogRecipeEntity> _allRecipes = [];

  Future<void> _loadCatalog() async {
    try {
      _allRecipes = await ref.read(recipeCatalogServiceProvider).loadCatalog();
      state = RecipeCatalogState(
        recipes: _allRecipes,
        filteredRecipes: _allRecipes,
        availableTags: _extractTags(_allRecipes),
        activeTag: null,
        searchQuery: '',
      );
    } catch (e) {
      state = RecipeCatalogState(errorMessage: e.toString());
    }
  }

  Future<void> loadCatalog() async {
    state = const RecipeCatalogState();
    await _loadCatalog();
  }

  void searchCatalog(String query) {
    if (!state.isLoaded) return;
    final lowerQuery = query.toLowerCase();
    final filtered = _applyFilters(lowerQuery, state.activeTag);
    state = RecipeCatalogState(
      recipes: state.recipes,
      filteredRecipes: filtered,
      availableTags: state.availableTags,
      activeTag: state.activeTag,
      searchQuery: query,
    );
  }

  void filterByTag(String tag) {
    if (!state.isLoaded) return;
    final newTag = tag == state.activeTag ? null : tag;
    final filtered = _applyFilters(state.searchQuery, newTag);
    state = RecipeCatalogState(
      recipes: state.recipes,
      filteredRecipes: filtered,
      availableTags: state.availableTags,
      activeTag: newTag,
      searchQuery: state.searchQuery,
    );
  }

  void loadRecipe(String recipeId) {
    if (!state.isLoaded) return;
    final recipe = _allRecipes.firstWhere(
      (r) => r.id == recipeId,
      orElse: () => throw StateError('Recipe not found'),
    );
    state = RecipeCatalogState(
      recipes: state.recipes,
      filteredRecipes: state.filteredRecipes,
      availableTags: state.availableTags,
      activeTag: state.activeTag,
      searchQuery: state.searchQuery,
      selectedRecipe: recipe,
    );
  }

  List<CatalogRecipeEntity> _applyFilters(String query, String? tag) {
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

final recipeCatalogNotifierProvider =
    NotifierProvider<RecipeCatalogNotifier, RecipeCatalogState>(RecipeCatalogNotifier.new);