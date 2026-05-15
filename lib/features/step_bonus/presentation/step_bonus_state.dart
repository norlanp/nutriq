part of 'step_bonus_bloc.dart';

abstract class StepBonusState extends Equatable {
  const StepBonusState();

  @override
  List<Object?> get props => [];
}

class StepBonusInitial extends StepBonusState {}

class StepBonusLoading extends StepBonusState {}

class StepBonusLoaded extends StepBonusState {
  final bool isEnabled;
  final double percent;
  final int todaySteps;
  final double calorieCredit;

  const StepBonusLoaded({
    required this.isEnabled,
    required this.percent,
    required this.todaySteps,
    required this.calorieCredit,
  });

  @override
  List<Object?> get props => [isEnabled, percent, todaySteps, calorieCredit];

  StepBonusLoaded copyWith({
    bool? isEnabled,
    double? percent,
    int? todaySteps,
    double? calorieCredit,
  }) {
    return StepBonusLoaded(
      isEnabled: isEnabled ?? this.isEnabled,
      percent: percent ?? this.percent,
      todaySteps: todaySteps ?? this.todaySteps,
      calorieCredit: calorieCredit ?? this.calorieCredit,
    );
  }
}

class StepBonusError extends StepBonusState {
  final String message;

  const StepBonusError(this.message);

  @override
  List<Object?> get props => [message];
}
