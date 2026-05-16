import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';
import 'package:nutriq/features/food_grade/presentation/notifier/food_grade_state.dart';

class FoodGradeNotifier extends Notifier<FoodGradeState> {
  @override
  FoodGradeState build() => const FoodGradeState();

  void calculateGrade({
    required double calories,
    required double proteinG,
    required double fiberG,
    required double sugarG,
    required double sodiumMg,
    required double totalFatG,
    required double saturatedFatG,
  }) {
    try {
      final grade = FoodGradeCalculator.calculate(
        calories: calories,
        proteinG: proteinG,
        fiberG: fiberG,
        sugarG: sugarG,
        sodiumMg: sodiumMg,
        totalFatG: totalFatG,
        saturatedFatG: saturatedFatG,
      );
      final score = _computeScore(
        calories: calories,
        proteinG: proteinG,
        fiberG: fiberG,
        sugarG: sugarG,
        sodiumMg: sodiumMg,
        saturatedFatG: saturatedFatG,
      );
      state = FoodGradeState(grade: grade, score: score);
    } catch (e) {
      state = FoodGradeState(errorMessage: e.toString());
    }
  }

  void filterByMinGrade(FoodGrade minGrade) {
    try {
      state = const FoodGradeState(filteredItems: []);
    } catch (e) {
      state = FoodGradeState(errorMessage: e.toString());
    }
  }

  int _computeScore({
    required double calories,
    required double proteinG,
    required double fiberG,
    required double sugarG,
    required double sodiumMg,
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

    return score.round();
  }
}

final foodGradeNotifierProvider =
    NotifierProvider<FoodGradeNotifier, FoodGradeState>(FoodGradeNotifier.new);