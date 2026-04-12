part of 'meal_timing_bloc.dart';

abstract class MealTimingEvent extends Equatable {
  const MealTimingEvent();

  @override
  List<Object?> get props => [];
}

class LoadMealTimingWeek extends MealTimingEvent {
  final DateTime startDate;

  const LoadMealTimingWeek({required this.startDate});

  @override
  List<Object?> get props => [startDate];
}
