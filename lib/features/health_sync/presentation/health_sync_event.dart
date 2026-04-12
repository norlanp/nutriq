part of 'health_sync_bloc.dart';

abstract class HealthSyncEvent extends Equatable {
  const HealthSyncEvent();

  @override
  List<Object?> get props => [];
}

class LoadSyncStatus extends HealthSyncEvent {
  const LoadSyncStatus();
}

class RequestPermissions extends HealthSyncEvent {
  const RequestPermissions();
}

class SyncAll extends HealthSyncEvent {
  const SyncAll();
}

class SyncSteps extends HealthSyncEvent {
  const SyncSteps();
}

class SyncWorkouts extends HealthSyncEvent {
  const SyncWorkouts();
}

class SyncWeight extends HealthSyncEvent {
  const SyncWeight();
}

class ToggleStepsSync extends HealthSyncEvent {
  final bool enabled;

  const ToggleStepsSync({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}

class ToggleWorkoutsSync extends HealthSyncEvent {
  final bool enabled;

  const ToggleWorkoutsSync({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}

class ToggleWeightSync extends HealthSyncEvent {
  final bool enabled;

  const ToggleWeightSync({required this.enabled});

  @override
  List<Object?> get props => [enabled];
}
