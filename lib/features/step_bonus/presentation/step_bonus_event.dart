part of 'step_bonus_bloc.dart';

abstract class StepBonusEvent extends Equatable {
  const StepBonusEvent();

  @override
  List<Object?> get props => [];
}

class LoadStepBonusConfig extends StepBonusEvent {
  const LoadStepBonusConfig();
}

class ToggleStepBonus extends StepBonusEvent {
  final bool enabled;

  const ToggleStepBonus({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}

class SetStepBonusPercent extends StepBonusEvent {
  final double percent;

  const SetStepBonusPercent({required this.percent});

  @override
  List<Object?> get props => [percent];
}

class RefreshStepCredit extends StepBonusEvent {
  const RefreshStepCredit();
}
