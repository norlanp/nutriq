part of 'health_sync_bloc.dart';

abstract class HealthSyncState extends Equatable {
  const HealthSyncState();

  @override
  List<Object?> get props => [];
}

class HealthSyncInitial extends HealthSyncState {}

class HealthSyncLoading extends HealthSyncState {}

class HealthSyncLoaded extends HealthSyncState {
  final bool stepsEnabled;
  final bool workoutsEnabled;
  final bool weightEnabled;
  final bool isAuthorized;
  final DateTime? lastSyncTimestamp;
  final int? syncedSteps;
  final List<HealthWorkout>? syncedWorkouts;

  const HealthSyncLoaded({
    required this.stepsEnabled,
    required this.workoutsEnabled,
    required this.weightEnabled,
    this.isAuthorized = false,
    this.lastSyncTimestamp,
    this.syncedSteps,
    this.syncedWorkouts,
  });

  HealthSyncLoaded copyWith({
    bool? stepsEnabled,
    bool? workoutsEnabled,
    bool? weightEnabled,
    bool? isAuthorized,
    DateTime? lastSyncTimestamp,
    int? syncedSteps,
    List<HealthWorkout>? syncedWorkouts,
  }) {
    return HealthSyncLoaded(
      stepsEnabled: stepsEnabled ?? this.stepsEnabled,
      workoutsEnabled: workoutsEnabled ?? this.workoutsEnabled,
      weightEnabled: weightEnabled ?? this.weightEnabled,
      isAuthorized: isAuthorized ?? this.isAuthorized,
      lastSyncTimestamp: lastSyncTimestamp ?? this.lastSyncTimestamp,
      syncedSteps: syncedSteps ?? this.syncedSteps,
      syncedWorkouts: syncedWorkouts ?? this.syncedWorkouts,
    );
  }

  @override
  List<Object?> get props => [
        stepsEnabled,
        workoutsEnabled,
        weightEnabled,
        isAuthorized,
        lastSyncTimestamp,
        syncedSteps,
        syncedWorkouts,
      ];
}

class HealthSyncError extends HealthSyncState {
  final String message;

  const HealthSyncError(this.message);

  @override
  List<Object?> get props => [message];
}
