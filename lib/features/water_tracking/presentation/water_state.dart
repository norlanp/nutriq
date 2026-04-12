part of 'water_bloc.dart';

abstract class WaterState extends Equatable {
  const WaterState();

  @override
  List<Object?> get props => [];
}

class WaterInitial extends WaterState {}

class WaterLoading extends WaterState {}

class WaterLoaded extends WaterState {
  final List<WaterEntity> entries;
  final int dailyTotal;
  final int dailyGoal;

  const WaterLoaded({
    required this.entries,
    required this.dailyTotal,
    required this.dailyGoal,
  });

  double get progress => dailyGoal > 0 ? dailyTotal / dailyGoal : 0.0;

  @override
  List<Object?> get props => [entries, dailyTotal, dailyGoal];
}

class WaterError extends WaterState {
  final String message;

  const WaterError(this.message);

  @override
  List<Object?> get props => [message];
}
