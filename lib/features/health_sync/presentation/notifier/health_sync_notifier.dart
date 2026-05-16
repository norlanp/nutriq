import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';
import 'package:nutriq/features/health_sync/presentation/notifier/health_sync_state.dart';
import 'package:nutriq/features/health_sync/providers/health_sync_providers.dart';

class HealthSyncNotifier extends Notifier<HealthSyncState> {
  @override
  HealthSyncState build() => const HealthSyncState();

  Future<void> requestPermissions() async {
    state = const HealthSyncState(isLoading: true);
    try {
      final authorized =
          await ref.read(healthSyncServiceProvider).requestAuthorization();
      if (authorized) {
        state = const HealthSyncState(isAuthorized: true);
      } else {
        state = const HealthSyncState(errorMessage: 'Permission denied');
      }
    } catch (e) {
      state = HealthSyncState(errorMessage: e.toString());
    }
  }

  Future<void> syncAll() async {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: current.stepsEnabled,
      workoutsEnabled: current.workoutsEnabled,
      weightEnabled: current.weightEnabled,
      isAuthorized: current.isAuthorized,
      isLoading: true,
    );
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));

      int? steps;
      List<HealthWorkout>? workouts;

      if (current.stepsEnabled) {
        steps = await ref.read(syncStepsUsecaseProvider)(start, now);
      }

      if (current.workoutsEnabled) {
        workouts = await ref.read(syncWorkoutsUsecaseProvider)(start, now);
      }

      if (current.weightEnabled) {
        await ref.read(syncWeightUsecaseProvider).readFromPlatform(start, now);
        final appWeights = await ref
            .read(weightRepositoryProvider)
            .getWeightsBetweenDates(start, now);
        for (final w in appWeights) {
          await ref.read(syncWeightUsecaseProvider).writeToPlatform(w);
        }
      }

      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        lastSyncTimestamp: now,
        syncedSteps: steps,
        syncedWorkouts: workouts,
      );
    } catch (e) {
      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> syncSteps() async {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: current.stepsEnabled,
      workoutsEnabled: current.workoutsEnabled,
      weightEnabled: current.weightEnabled,
      isAuthorized: current.isAuthorized,
      isLoading: true,
    );
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));
      final steps = await ref.read(syncStepsUsecaseProvider)(start, now);

      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        lastSyncTimestamp: now,
        syncedSteps: steps,
        syncedWorkouts: current.syncedWorkouts,
      );
    } catch (e) {
      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> syncWorkouts() async {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: current.stepsEnabled,
      workoutsEnabled: current.workoutsEnabled,
      weightEnabled: current.weightEnabled,
      isAuthorized: current.isAuthorized,
      isLoading: true,
    );
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));
      final workouts =
          await ref.read(syncWorkoutsUsecaseProvider)(start, now);

      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        lastSyncTimestamp: now,
        syncedSteps: current.syncedSteps,
        syncedWorkouts: workouts,
      );
    } catch (e) {
      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> syncWeight() async {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: current.stepsEnabled,
      workoutsEnabled: current.workoutsEnabled,
      weightEnabled: current.weightEnabled,
      isAuthorized: current.isAuthorized,
      isLoading: true,
    );
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));

      await ref.read(syncWeightUsecaseProvider).readFromPlatform(start, now);
      final appWeights = await ref
          .read(weightRepositoryProvider)
          .getWeightsBetweenDates(start, now);
      for (final w in appWeights) {
        await ref.read(syncWeightUsecaseProvider).writeToPlatform(w);
      }

      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        lastSyncTimestamp: now,
        syncedSteps: current.syncedSteps,
        syncedWorkouts: current.syncedWorkouts,
      );
    } catch (e) {
      state = HealthSyncState(
        stepsEnabled: current.stepsEnabled,
        workoutsEnabled: current.workoutsEnabled,
        weightEnabled: current.weightEnabled,
        isAuthorized: current.isAuthorized,
        errorMessage: e.toString(),
      );
    }
  }

  void toggleStepsSync(bool enabled) {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: enabled,
      workoutsEnabled: current.workoutsEnabled,
      weightEnabled: current.weightEnabled,
      isAuthorized: current.isAuthorized,
      lastSyncTimestamp: current.lastSyncTimestamp,
      syncedSteps: current.syncedSteps,
      syncedWorkouts: current.syncedWorkouts,
    );
  }

  void toggleWorkoutsSync(bool enabled) {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: current.stepsEnabled,
      workoutsEnabled: enabled,
      weightEnabled: current.weightEnabled,
      isAuthorized: current.isAuthorized,
      lastSyncTimestamp: current.lastSyncTimestamp,
      syncedSteps: current.syncedSteps,
      syncedWorkouts: current.syncedWorkouts,
    );
  }

  void toggleWeightSync(bool enabled) {
    final current = state;
    state = HealthSyncState(
      stepsEnabled: current.stepsEnabled,
      workoutsEnabled: current.workoutsEnabled,
      weightEnabled: enabled,
      isAuthorized: current.isAuthorized,
      lastSyncTimestamp: current.lastSyncTimestamp,
      syncedSteps: current.syncedSteps,
      syncedWorkouts: current.syncedWorkouts,
    );
  }
}

final healthSyncNotifierProvider =
    NotifierProvider<HealthSyncNotifier, HealthSyncState>(
        HealthSyncNotifier.new);