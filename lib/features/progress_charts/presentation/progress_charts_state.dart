part of 'progress_charts_bloc.dart';

abstract class ProgressChartsState extends Equatable {
  const ProgressChartsState();

  @override
  List<Object?> get props => [];
}

class ProgressChartsInitial extends ProgressChartsState {}

class ProgressChartsLoading extends ProgressChartsState {}

class ProgressChartsLoaded extends ProgressChartsState {
  final List<TrackedDayEntity> trackedDays;
  final List<WeightEntity> weights;
  final DateTime startDate;
  final ViewMode viewMode;

  const ProgressChartsLoaded({
    required this.trackedDays,
    required this.weights,
    required this.startDate,
    required this.viewMode,
  });

  @override
  List<Object?> get props => [trackedDays, weights, startDate, viewMode];
}

class ProgressChartsError extends ProgressChartsState {
  final String message;

  const ProgressChartsError(this.message);

  @override
  List<Object?> get props => [message];
}
