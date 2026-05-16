import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

part 'recipe_item_entity.freezed.dart';

@freezed
class RecipeItemEntity with _$RecipeItemEntity {
  const factory RecipeItemEntity({
    required String id,
    required String recipeId,
    required MealEntity meal,
    required double amount,
    required String unit,
  }) = _RecipeItemEntity;

  const RecipeItemEntity._();

  double get totalKcal => amount * (meal.nutriments.energyPerUnit ?? 0);
  double get totalCarbsGram =>
      amount * (meal.nutriments.carbohydratesPerUnit ?? 0);
  double get totalFatsGram => amount * (meal.nutriments.fatPerUnit ?? 0);
  double get totalProteinsGram =>
      amount * (meal.nutriments.proteinsPerUnit ?? 0);
}