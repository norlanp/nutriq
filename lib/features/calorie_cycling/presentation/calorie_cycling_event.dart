part of 'calorie_cycling_bloc.dart';

abstract class CalorieCyclingEvent extends Equatable {
  const CalorieCyclingEvent();

  @override
  List<Object?> get props => [];
}

class LoadCycle extends CalorieCyclingEvent {
  const LoadCycle();
}

class SaveCycle extends CalorieCyclingEvent {
  final Map<int, double> weekdayCalorieMap;

  const SaveCycle({required this.weekdayCalorieMap});

  @override
  List<Object?> get props => [weekdayCalorieMap];
}

class ToggleCycling extends CalorieCyclingEvent {
  final bool enabled;

  const ToggleCycling({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}
