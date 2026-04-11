import 'package:equatable/equatable.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class RecipeItemEntity extends Equatable {
  final String id;
  final String recipeId;
  final MealEntity meal;
  final double amount;
  final String unit;

  const RecipeItemEntity({
    required this.id,
    required this.recipeId,
    required this.meal,
    required this.amount,
    required this.unit,
  });

  double get totalKcal => amount * (meal.nutriments.energyPerUnit ?? 0);
  double get totalCarbsGram =>
      amount * (meal.nutriments.carbohydratesPerUnit ?? 0);
  double get totalFatsGram => amount * (meal.nutriments.fatPerUnit ?? 0);
  double get totalProteinsGram =>
      amount * (meal.nutriments.proteinsPerUnit ?? 0);

  @override
  List<Object?> get props => [id, recipeId, amount, unit];
}
