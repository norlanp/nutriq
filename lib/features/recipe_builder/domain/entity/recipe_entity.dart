import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';

part 'recipe_entity.freezed.dart';

@freezed
class RecipeEntity with _$RecipeEntity {
  const factory RecipeEntity({
    required String id,
    required String name,
    required String servings,
    required DateTime createdAt,
    required DateTime updatedAt,
    required List<RecipeItemEntity> items,
  }) = _RecipeEntity;

  const RecipeEntity._();

  double get totalKcal => items.fold(0, (sum, item) => sum + item.totalKcal);
  double get totalCarbsGram =>
      items.fold(0, (sum, item) => sum + item.totalCarbsGram);
  double get totalFatsGram =>
      items.fold(0, (sum, item) => sum + item.totalFatsGram);
  double get totalProteinsGram =>
      items.fold(0, (sum, item) => sum + item.totalProteinsGram);
}