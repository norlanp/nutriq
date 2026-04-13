import 'package:equatable/equatable.dart';

class ScrapedRecipeEntity extends Equatable {
  final String name;
  final String description;
  final List<String> ingredients;
  final List<String> instructions;
  final int? servings;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final double? calories;
  final double? proteinG;
  final double? carbsG;
  final double? fatG;
  final String sourceUrl;

  const ScrapedRecipeEntity({
    required this.name,
    this.description = '',
    required this.ingredients,
    required this.instructions,
    this.servings,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.calories,
    this.proteinG,
    this.carbsG,
    this.fatG,
    required this.sourceUrl,
  });

  @override
  List<Object?> get props => [
        name,
        description,
        ingredients,
        instructions,
        servings,
        prepTimeMinutes,
        cookTimeMinutes,
        calories,
        proteinG,
        carbsG,
        fatG,
        sourceUrl,
      ];
}
