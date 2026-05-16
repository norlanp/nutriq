import 'package:freezed_annotation/freezed_annotation.dart';

part 'scraped_recipe_entity.freezed.dart';

@freezed
class ScrapedRecipeEntity with _$ScrapedRecipeEntity {
  const ScrapedRecipeEntity._();

  const factory ScrapedRecipeEntity({
    required String name,
    @Default('') String description,
    required List<String> ingredients,
    required List<String> instructions,
    int? servings,
    int? prepTimeMinutes,
    int? cookTimeMinutes,
    double? calories,
    double? proteinG,
    double? carbsG,
    double? fatG,
    required String sourceUrl,
  }) = _ScrapedRecipeEntity;
}