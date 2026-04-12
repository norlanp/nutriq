part of 'meal_timing_bloc.dart';

abstract class MealTimingState extends Equatable {
  const MealTimingState();
}

class MealTimingInitial extends MealTimingState {
  @override
  List<Object?> get props => [];
}

class MealTimingLoading extends MealTimingState {
  @override
  List<Object?> get props => [];
}

class MealTimingLoaded extends MealTimingState {
  final List<IntakeEntity> intakes;
  final Map<IntakeTypeEntity, TimeOfDay> avgMealTimes;
  final Map<IntakeTypeEntity, List<TimeOfDay>> mealTimeDistribution;
  final DateTime startDate;

  const MealTimingLoaded({
    required this.intakes,
    required this.avgMealTimes,
    required this.mealTimeDistribution,
    required this.startDate,
  });

  @override
  List<Object?> get props => [intakes, avgMealTimes, startDate];
}

class MealTimingError extends MealTimingState {
  final String message;

  const MealTimingError(this.message);

  @override
  List<Object?> get props => [message];
}
