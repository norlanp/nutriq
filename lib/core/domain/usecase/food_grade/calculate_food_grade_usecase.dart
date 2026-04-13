import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';

class CalculateFoodGradeUsecase {
  FoodGrade call({
    required double calories,
    required double proteinG,
    required double fiberG,
    required double sugarG,
    required double sodiumMg,
    required double totalFatG,
    required double saturatedFatG,
  }) {
    return FoodGradeCalculator.calculate(
      calories: calories,
      proteinG: proteinG,
      fiberG: fiberG,
      sugarG: sugarG,
      sodiumMg: sodiumMg,
      totalFatG: totalFatG,
      saturatedFatG: saturatedFatG,
    );
  }
}
