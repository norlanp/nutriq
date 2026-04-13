part of 'autopilot_bloc.dart';

abstract class AutopilotEvent extends Equatable {
  const AutopilotEvent();

  @override
  List<Object?> get props => [];
}

class LoadAutopilotStatus extends AutopilotEvent {
  final int userId;

  const LoadAutopilotStatus({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class ToggleAutopilot extends AutopilotEvent {
  final int userId;
  final bool enabled;
  final int baselineCalories;

  const ToggleAutopilot({
    required this.userId,
    required this.enabled,
    required this.baselineCalories,
  });

  @override
  List<Object?> get props => [userId, enabled, baselineCalories];
}

class RecalculateBudget extends AutopilotEvent {
  final int userId;
  final int baselineCalories;

  const RecalculateBudget({
    required this.userId,
    required this.baselineCalories,
  });

  @override
  List<Object?> get props => [userId, baselineCalories];
}

class ToggleExerciseCredit extends AutopilotEvent {
  final ExerciseCalorieModeEntity mode;

  const ToggleExerciseCredit({required this.mode});

  @override
  List<Object?> get props => [mode];
}

class SetExerciseCreditPercent extends AutopilotEvent {
  final double percent;

  const SetExerciseCreditPercent({required this.percent});

  @override
  List<Object?> get props => [percent];
}
