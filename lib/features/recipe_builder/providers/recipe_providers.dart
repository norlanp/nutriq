import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/service/recipe_catalog_service.dart';
import 'package:nutriq/core/domain/usecase/recipe_import/import_recipe_usecase.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/add_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/delete_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/get_recipes_usecase.dart';

final importRecipeUsecaseProvider = Provider((ref) {
  return ImportRecipeUsecase(ref.watch(recipeScraperServiceProvider));
});

final getRecipesUsecaseProvider = Provider((ref) {
  return GetRecipesUsecase(ref.watch(recipeRepositoryProvider));
});

final addRecipeUsecaseProvider = Provider((ref) {
  return AddRecipeUsecase(ref.watch(recipeRepositoryProvider));
});

final deleteRecipeUsecaseProvider = Provider((ref) {
  return DeleteRecipeUsecase(ref.watch(recipeRepositoryProvider));
});

final recipeCatalogServiceProvider = Provider<RecipeCatalogService>((ref) {
  return RecipeCatalogServiceImpl();
});