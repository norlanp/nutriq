import 'package:equatable/equatable.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class HealthSyncState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool stepsEnabled;
  final bool workoutsEnabled;
  final bool weightEnabled;
  final bool isAuthorized;
  final DateTime? lastSyncTimestamp;
  final int? syncedSteps;
  final List<HealthWorkout>? syncedWorkouts;

  const HealthSyncState({
    this.isLoading = false,
    this.errorMessage,
    this.stepsEnabled = true,
    this.workoutsEnabled = true,
    this.weightEnabled = true,
    this.isAuthorized = false,
    this.lastSyncTimestamp,
    this.syncedSteps,
    this.syncedWorkouts,
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        stepsEnabled,
        workoutsEnabled,
        weightEnabled,
        isAuthorized,
        lastSyncTimestamp,
        syncedSteps,
        syncedWorkouts,
      ];
}