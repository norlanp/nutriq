import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

part 'scanned_menu_item.freezed.dart';

@freezed
abstract class ScannedMenuItem with _$ScannedMenuItem {
  const factory ScannedMenuItem({
    required String name,
    double? menuPrice,
    MealEntity? mealMatch,
    FoodGrade? foodGrade,
    @Default(0.0) double matchConfidence,
    @Default(false) bool isSelected,
  }) = _ScannedMenuItem;

  const ScannedMenuItem._();

  bool get hasNutritionInfo => mealMatch != null;

  double? get calories => mealMatch?.nutriments.energyKcal100;
  double? get protein => mealMatch?.nutriments.proteins100;
  double? get carbs => mealMatch?.nutriments.carbohydrates100;
  double? get fat => mealMatch?.nutriments.fat100;
  double? get fiber => mealMatch?.nutriments.fiber100;
  double? get sugar => mealMatch?.nutriments.sugars100;
  double? get saturatedFat => mealMatch?.nutriments.saturatedFat100;
  double? get sodium => mealMatch?.nutriments.sodium100;
}