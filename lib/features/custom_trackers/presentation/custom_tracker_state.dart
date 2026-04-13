part of 'custom_tracker_bloc.dart';

abstract class CustomTrackerState extends Equatable {
  const CustomTrackerState();

  @override
  List<Object?> get props => [];
}

class CustomTrackerInitial extends CustomTrackerState {}

class CustomTrackerLoading extends CustomTrackerState {}

class CustomTrackerLoaded extends CustomTrackerState {
  final List<CustomTrackerEntity> trackers;
  final List<CustomTrackerEntryEntity> entries;

  const CustomTrackerLoaded({required this.trackers, required this.entries});

  @override
  List<Object?> get props => [trackers, entries];
}

class CustomTrackerError extends CustomTrackerState {
  final String message;

  const CustomTrackerError(this.message);

  @override
  List<Object?> get props => [message];
}
