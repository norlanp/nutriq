import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';

part 'food_grade_event.dart';
part 'food_grade_state.dart';

class FoodGradeBloc extends Bloc<FoodGradeEvent, FoodGradeState> {
  FoodGradeBloc() : super(FoodGradeInitial()) {
    on<CalculateGrade>(_onCalculateGrade);
    on<FilterByMinGrade>(_onFilterByMinGrade);
  }

  void _onCalculateGrade(
    CalculateGrade event,
    Emitter<FoodGradeState> emit,
  ) {
    try {
      final grade = FoodGradeCalculator.calculate(
        calories: event.calories,
        proteinG: event.proteinG,
        fiberG: event.fiberG,
        sugarG: event.sugarG,
        sodiumMg: event.sodiumMg,
        totalFatG: event.totalFatG,
        saturatedFatG: event.saturatedFatG,
      );
      final score = _computeScore(
        calories: event.calories,
        proteinG: event.proteinG,
        fiberG: event.fiberG,
        sugarG: event.sugarG,
        sodiumMg: event.sodiumMg,
        saturatedFatG: event.saturatedFatG,
      );
      emit(FoodGradeCalculated(grade: grade, score: score));
    } catch (e) {
      emit(FoodGradeError(e.toString()));
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

  void _onFilterByMinGrade(
    FilterByMinGrade event,
    Emitter<FoodGradeState> emit,
  ) {
    try {
      emit(const FoodGradeFiltered(filteredItems: []));
    } catch (e) {
      emit(FoodGradeError(e.toString()));
    }
  }
}
