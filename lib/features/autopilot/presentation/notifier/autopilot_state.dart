import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';

class AutopilotState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final int baselineCalories;
  final int adjustedCalories;
  final bool isEnabled;
  final DateTime? lastAdjustmentDate;
  final ExerciseCalorieModeEntity exerciseCalorieMode;
  final double exerciseCreditPercent;

  const AutopilotState({
    this.isLoading = false,
    this.errorMessage,
    this.baselineCalories = 0,
    this.adjustedCalories = 0,
    this.isEnabled = false,
    this.lastAdjustmentDate,
    this.exerciseCalorieMode = ExerciseCalorieModeEntity.half,
    this.exerciseCreditPercent = 0.5,
  });

  bool get hasError => errorMessage != null;
  bool get isLoaded => lastAdjustmentDate != null;
  int get adjustmentDelta => adjustedCalories - baselineCalories;

  AutopilotState copyWith({
    bool? isLoading,
    String? errorMessage,
    int? baselineCalories,
    int? adjustedCalories,
    bool? isEnabled,
    DateTime? lastAdjustmentDate,
    ExerciseCalorieModeEntity? exerciseCalorieMode,
    double? exerciseCreditPercent,
  }) {
    return AutopilotState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      baselineCalories: baselineCalories ?? this.baselineCalories,
      adjustedCalories: adjustedCalories ?? this.adjustedCalories,
      isEnabled: isEnabled ?? this.isEnabled,
      lastAdjustmentDate: lastAdjustmentDate ?? this.lastAdjustmentDate,
      exerciseCalorieMode: exerciseCalorieMode ?? this.exerciseCalorieMode,
      exerciseCreditPercent: exerciseCreditPercent ?? this.exerciseCreditPercent,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        baselineCalories,
        adjustedCalories,
        isEnabled,
        lastAdjustmentDate,
        exerciseCalorieMode,
        exerciseCreditPercent,
      ];
}