import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_recipe_entity.freezed.dart';
part 'catalog_recipe_entity.g.dart';

@freezed
abstract class CatalogRecipeMacros with _$CatalogRecipeMacros {
  const CatalogRecipeMacros._();

  const factory CatalogRecipeMacros({
    required double proteinG,
    required double carbsG,
    required double fatG,
    @Default(0) double fiberG,
  }) = _CatalogRecipeMacros;

  static const empty = CatalogRecipeMacros(
    proteinG: 0,
    carbsG: 0,
    fatG: 0,
    fiberG: 0,
  );

  factory CatalogRecipeMacros.fromJson(Map<String, dynamic> json) =>
      _$CatalogRecipeMacrosFromJson(json);
}

@freezed
abstract class CatalogRecipeEntity with _$CatalogRecipeEntity {
  const CatalogRecipeEntity._();

  const factory CatalogRecipeEntity({
    required String id,
    required String title,
    @Default('') String description,
    @Default(1) int servings,
    @Default(0) int prepTime,
    @Default(0) int cookTime,
    @Default(0.0) double calories,
    @Default(CatalogRecipeMacros.empty) CatalogRecipeMacros macros,
    @Default([]) List<String> ingredients,
    @Default([]) List<String> steps,
    @Default([]) List<String> tags,
    @Default('') String imageUrl,
  }) = _CatalogRecipeEntity;

  factory CatalogRecipeEntity.fromJson(Map<String, dynamic> json) =>
      _$CatalogRecipeEntityFromJson(json);
}