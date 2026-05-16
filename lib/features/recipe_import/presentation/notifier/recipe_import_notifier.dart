import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/exception/recipe_import_exception.dart';
import 'package:nutriq/features/recipe_builder/providers/recipe_providers.dart';
import 'package:nutriq/features/recipe_import/presentation/notifier/recipe_import_state.dart';

class RecipeImportNotifier extends Notifier<RecipeImportState> {
  @override
  RecipeImportState build() => const RecipeImportState();

  Future<void> importUrl(String url) async {
    state = const RecipeImportState(isImporting: true);
    try {
      final recipe = await ref.read(importRecipeUsecaseProvider)(url);
      state = RecipeImportState(previewRecipe: recipe);
    } on RecipeImportException catch (e) {
      state = RecipeImportState(errorMessage: e.message);
    } catch (e) {
      state = RecipeImportState(errorMessage: e.toString());
    }
  }

  void confirmImport() {
    state = const RecipeImportState(isImported: true);
  }
}

final recipeImportNotifierProvider =
    NotifierProvider<RecipeImportNotifier, RecipeImportState>(RecipeImportNotifier.new);