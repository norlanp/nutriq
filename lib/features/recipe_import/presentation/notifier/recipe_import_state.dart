import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/scraped_recipe_entity.dart';

class RecipeImportState extends Equatable {
  final ScrapedRecipeEntity? previewRecipe;
  final bool isImporting;
  final bool isImported;
  final String? errorMessage;

  const RecipeImportState({
    this.previewRecipe,
    this.isImporting = false,
    this.isImported = false,
    this.errorMessage,
  });

  bool get isPreview => previewRecipe != null;
  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [previewRecipe, isImporting, isImported, errorMessage];
}