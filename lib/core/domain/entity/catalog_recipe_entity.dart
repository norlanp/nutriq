import 'package:equatable/equatable.dart';

class CatalogRecipeMacros extends Equatable {
  final double proteinG;
  final double carbsG;
  final double fatG;
  final double fiberG;

  const CatalogRecipeMacros({
    required this.proteinG,
    required this.carbsG,
    required this.fatG,
    this.fiberG = 0,
  });

  factory CatalogRecipeMacros.fromJson(Map<String, dynamic> json) =>
      CatalogRecipeMacros(
        proteinG: (json['proteinG'] as num?)?.toDouble() ?? 0,
        carbsG: (json['carbsG'] as num?)?.toDouble() ?? 0,
        fatG: (json['fatG'] as num?)?.toDouble() ?? 0,
        fiberG: (json['fiberG'] as num?)?.toDouble() ?? 0,
      );

  static const empty = CatalogRecipeMacros(
    proteinG: 0,
    carbsG: 0,
    fatG: 0,
    fiberG: 0,
  );

  @override
  List<Object?> get props => [proteinG, carbsG, fatG, fiberG];
}

class CatalogRecipeEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final int servings;
  final int prepTime;
  final int cookTime;
  final double calories;
  final CatalogRecipeMacros macros;
  final List<String> ingredients;
  final List<String> steps;
  final List<String> tags;
  final String imageUrl;

  const CatalogRecipeEntity({
    required this.id,
    required this.title,
    this.description = '',
    this.servings = 1,
    this.prepTime = 0,
    this.cookTime = 0,
    this.calories = 0,
    this.macros = CatalogRecipeMacros.empty,
    this.ingredients = const [],
    this.steps = const [],
    this.tags = const [],
    this.imageUrl = '',
  });

  factory CatalogRecipeEntity.fromJson(Map<String, dynamic> json) =>
      CatalogRecipeEntity(
        id: json['id'] as String,
        title: json['title'] as String,
        description: (json['description'] as String?) ?? '',
        servings: (json['servings'] as num?)?.toInt() ?? 1,
        prepTime: (json['prepTime'] as num?)?.toInt() ?? 0,
        cookTime: (json['cookTime'] as num?)?.toInt() ?? 0,
        calories: (json['calories'] as num?)?.toDouble() ?? 0,
        macros: json['macros'] != null
            ? CatalogRecipeMacros.fromJson(
                json['macros'] as Map<String, dynamic>)
            : CatalogRecipeMacros.empty,
        ingredients: (json['ingredients'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        steps: (json['steps'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        tags: (json['tags'] as List<dynamic>?)
                ?.map((e) => e as String)
                .toList() ??
            [],
        imageUrl: (json['imageUrl'] as String?) ?? '',
      );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        servings,
        prepTime,
        cookTime,
        calories,
        macros,
        ingredients,
        steps,
        tags,
        imageUrl,
      ];
}
