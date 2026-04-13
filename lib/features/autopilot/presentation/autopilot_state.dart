part of 'autopilot_bloc.dart';

abstract class AutopilotState extends Equatable {
  const AutopilotState();

  @override
  List<Object?> get props => [];
}

class AutopilotInitial extends AutopilotState {}

class AutopilotLoading extends AutopilotState {}

class AutopilotLoaded extends AutopilotState {
  final int baselineCalories;
  final int adjustedCalories;
  final bool isEnabled;
  final DateTime lastAdjustmentDate;
  final ExerciseCalorieModeEntity exerciseCalorieMode;
  final double exerciseCreditPercent;

  const AutopilotLoaded({
    required this.baselineCalories,
    required this.adjustedCalories,
    required this.isEnabled,
    required this.lastAdjustmentDate,
    required this.exerciseCalorieMode,
    required this.exerciseCreditPercent,
  });

  int get adjustmentDelta => adjustedCalories - baselineCalories;

  AutopilotLoaded copyWith({
    int? baselineCalories,
    int? adjustedCalories,
    bool? isEnabled,
    DateTime? lastAdjustmentDate,
    ExerciseCalorieModeEntity? exerciseCalorieMode,
    double? exerciseCreditPercent,
  }) {
    return AutopilotLoaded(
      baselineCalories: baselineCalories ?? this.baselineCalories,
      adjustedCalories: adjustedCalories ?? this.adjustedCalories,
      isEnabled: isEnabled ?? this.isEnabled,
      lastAdjustmentDate: lastAdjustmentDate ?? this.lastAdjustmentDate,
      exerciseCalorieMode: exerciseCalorieMode ?? this.exerciseCalorieMode,
      exerciseCreditPercent:
          exerciseCreditPercent ?? this.exerciseCreditPercent,
    );
  }

  @override
  List<Object?> get props => [
        baselineCalories,
        adjustedCalories,
        isEnabled,
        lastAdjustmentDate,
        exerciseCalorieMode,
        exerciseCreditPercent,
      ];
}

class AutopilotError extends AutopilotState {
  final String message;

  const AutopilotError(this.message);

  @override
  List<Object?> get props => [message];
}
