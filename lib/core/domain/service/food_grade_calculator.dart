import 'package:nutriq/core/domain/entity/food_grade.dart';

class FoodGradeCalculator {
  static FoodGrade calculate({
    required double calories,
    required double proteinG,
    required double fiberG,
    required double sugarG,
    required double sodiumMg,
    required double totalFatG,
    required double saturatedFatG,
  }) {
    double score = 0;

    final proteinPer100Kcal = calories > 0 ? (proteinG / calories) * 100 : 0;
    if (proteinPer100Kcal >= 12) {
      score += 3;
    } else if (proteinPer100Kcal >= 8) {
      score += 2;
    } else if (proteinPer100Kcal >= 4) {
      score += 1;
    }

    if (fiberG >= 6) {
      score += 3;
    } else if (fiberG >= 3) {
      score += 2;
    } else if (fiberG >= 1.5) {
      score += 1;
    }

    if (sugarG >= 20) {
      score -= 3;
    } else if (sugarG >= 12) {
      score -= 2;
    } else if (sugarG >= 6) {
      score -= 1;
    }

    if (sodiumMg >= 600) {
      score -= 3;
    } else if (sodiumMg >= 400) {
      score -= 2;
    } else if (sodiumMg >= 200) {
      score -= 1;
    }

    if (saturatedFatG >= 5) {
      score -= 2;
    } else if (saturatedFatG >= 2.5) {
      score -= 1;
    }

    if (calories >= 400) {
      score -= 2;
    } else if (calories >= 250) {
      score -= 1;
    }

    if (score >= 3) return FoodGrade.a;
    if (score >= 1) return FoodGrade.b;
    if (score >= -1) return FoodGrade.c;
    return FoodGrade.d;
  }
}
