import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class ScannedMenuItem extends Equatable {
  final String name;
  final double? menuPrice;
  final MealEntity? mealMatch;
  final FoodGrade? foodGrade;
  final double matchConfidence;
  final bool isSelected;

  const ScannedMenuItem({
    required this.name,
    this.menuPrice,
    this.mealMatch,
    this.foodGrade,
    this.matchConfidence = 0.0,
    this.isSelected = false,
  });

  ScannedMenuItem copyWith({
    String? name,
    double? menuPrice,
    MealEntity? mealMatch,
    FoodGrade? foodGrade,
    double? matchConfidence,
    bool? isSelected,
  }) {
    return ScannedMenuItem(
      name: name ?? this.name,
      menuPrice: menuPrice ?? this.menuPrice,
      mealMatch: mealMatch ?? this.mealMatch,
      foodGrade: foodGrade ?? this.foodGrade,
      matchConfidence: matchConfidence ?? this.matchConfidence,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  bool get hasNutritionInfo => mealMatch != null;

  double? get calories => mealMatch?.nutriments.energyKcal100;
  double? get protein => mealMatch?.nutriments.proteins100;
  double? get carbs => mealMatch?.nutriments.carbohydrates100;
  double? get fat => mealMatch?.nutriments.fat100;
  double? get fiber => mealMatch?.nutriments.fiber100;
  double? get sugar => mealMatch?.nutriments.sugars100;
  double? get saturatedFat => mealMatch?.nutriments.saturatedFat100;
  double? get sodium => mealMatch?.nutriments.sodium100;

  @override
  List<Object?> get props => [
        name,
        menuPrice,
        mealMatch,
        foodGrade,
        matchConfidence,
        isSelected,
      ];
}
