import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';

class CalculateExerciseBudgetUsecase {
  int call({
    required int burnedCalories,
    required ExerciseCalorieModeEntity exerciseCalorieMode,
    required double exerciseCreditPercent,
  }) {
    if (burnedCalories <= 0) return 0;

    switch (exerciseCalorieMode) {
      case ExerciseCalorieModeEntity.none:
        return 0;
      case ExerciseCalorieModeEntity.half:
        return (burnedCalories * 0.5).round();
      case ExerciseCalorieModeEntity.full:
        return burnedCalories;
      case ExerciseCalorieModeEntity.custom:
        return (burnedCalories * exerciseCreditPercent).round();
    }
  }
}
