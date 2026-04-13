part of 'calorie_cycling_bloc.dart';

abstract class CalorieCyclingState extends Equatable {
  const CalorieCyclingState();

  @override
  List<Object?> get props => [];
}

class CalorieCyclingInitial extends CalorieCyclingState {}

class CalorieCyclingLoading extends CalorieCyclingState {}

class CalorieCyclingLoaded extends CalorieCyclingState {
  final Map<int, double> weekdayCalorieMap;
  final bool isEnabled;

  const CalorieCyclingLoaded({
    required this.weekdayCalorieMap,
    required this.isEnabled,
  });

  @override
  List<Object?> get props => [weekdayCalorieMap, isEnabled];
}

class CalorieCyclingSaved extends CalorieCyclingState {}

class CalorieCyclingError extends CalorieCyclingState {
  final String message;

  const CalorieCyclingError(this.message);

  @override
  List<Object?> get props => [message];
}
