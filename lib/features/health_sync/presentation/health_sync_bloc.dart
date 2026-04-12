import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_steps_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_weight_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_workouts_usecase.dart';

part 'health_sync_event.dart';
part 'health_sync_state.dart';

class HealthSyncBloc extends Bloc<HealthSyncEvent, HealthSyncState> {
  final HealthSyncService _healthSyncService;
  final SyncStepsUsecase _syncStepsUsecase;
  final SyncWorkoutsUsecase _syncWorkoutsUsecase;
  final SyncWeightUsecase _syncWeightUsecase;
  final WeightRepository _weightRepository;

  HealthSyncBloc(
    this._healthSyncService,
    this._syncStepsUsecase,
    this._syncWorkoutsUsecase,
    this._syncWeightUsecase,
    this._weightRepository,
  ) : super(HealthSyncInitial()) {
    on<LoadSyncStatus>(_onLoadSyncStatus);
    on<RequestPermissions>(_onRequestPermissions);
    on<SyncAll>(_onSyncAll);
    on<SyncSteps>(_onSyncSteps);
    on<SyncWorkouts>(_onSyncWorkouts);
    on<SyncWeight>(_onSyncWeight);
    on<ToggleStepsSync>(_onToggleStepsSync);
    on<ToggleWorkoutsSync>(_onToggleWorkoutsSync);
    on<ToggleWeightSync>(_onToggleWeightSync);
  }

  Future<void> _onLoadSyncStatus(
    LoadSyncStatus event,
    Emitter<HealthSyncState> emit,
  ) async {
    emit(const HealthSyncLoaded(
      stepsEnabled: true,
      workoutsEnabled: true,
      weightEnabled: true,
    ));
  }

  Future<void> _onRequestPermissions(
    RequestPermissions event,
    Emitter<HealthSyncState> emit,
  ) async {
    emit(HealthSyncLoading());
    try {
      final authorized = await _healthSyncService.requestAuthorization();
      if (authorized) {
        emit(const HealthSyncLoaded(
          stepsEnabled: true,
          workoutsEnabled: true,
          weightEnabled: true,
          isAuthorized: true,
        ));
      } else {
        emit(const HealthSyncError('Permission denied'));
      }
    } catch (e) {
      emit(HealthSyncError(e.toString()));
    }
  }

  Future<void> _onSyncAll(
    SyncAll event,
    Emitter<HealthSyncState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HealthSyncLoaded) return;

    emit(HealthSyncLoading());
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));

      int? steps;
      List<HealthWorkout>? workouts;

      if (currentState.stepsEnabled) {
        steps = await _syncStepsUsecase(start, now);
      }

      if (currentState.workoutsEnabled) {
        workouts = await _syncWorkoutsUsecase(start, now);
      }

      if (currentState.weightEnabled) {
        await _syncWeightUsecase.readFromPlatform(start, now);
        final appWeights =
            await _weightRepository.getWeightsBetweenDates(start, now);
        for (final w in appWeights) {
          await _syncWeightUsecase.writeToPlatform(w);
        }
      }

      emit(HealthSyncLoaded(
        stepsEnabled: currentState.stepsEnabled,
        workoutsEnabled: currentState.workoutsEnabled,
        weightEnabled: currentState.weightEnabled,
        isAuthorized: currentState.isAuthorized,
        lastSyncTimestamp: now,
        syncedSteps: steps,
        syncedWorkouts: workouts,
      ));
    } catch (e) {
      emit(HealthSyncError(e.toString()));
    }
  }

  Future<void> _onSyncSteps(
    SyncSteps event,
    Emitter<HealthSyncState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HealthSyncLoaded) return;

    emit(HealthSyncLoading());
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));
      final steps = await _syncStepsUsecase(start, now);

      emit(currentState.copyWith(
        syncedSteps: steps,
        lastSyncTimestamp: now,
      ));
    } catch (e) {
      emit(HealthSyncError(e.toString()));
    }
  }

  Future<void> _onSyncWorkouts(
    SyncWorkouts event,
    Emitter<HealthSyncState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HealthSyncLoaded) return;

    emit(HealthSyncLoading());
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));
      final workouts = await _syncWorkoutsUsecase(start, now);

      emit(currentState.copyWith(
        syncedWorkouts: workouts,
        lastSyncTimestamp: now,
      ));
    } catch (e) {
      emit(HealthSyncError(e.toString()));
    }
  }

  Future<void> _onSyncWeight(
    SyncWeight event,
    Emitter<HealthSyncState> emit,
  ) async {
    final currentState = state;
    if (currentState is! HealthSyncLoaded) return;

    emit(HealthSyncLoading());
    try {
      final now = DateTime.now();
      final start = now.subtract(const Duration(days: 1));

      await _syncWeightUsecase.readFromPlatform(start, now);
      final appWeights =
          await _weightRepository.getWeightsBetweenDates(start, now);
      for (final w in appWeights) {
        await _syncWeightUsecase.writeToPlatform(w);
      }

      emit(currentState.copyWith(lastSyncTimestamp: now));
    } catch (e) {
      emit(HealthSyncError(e.toString()));
    }
  }

  void _onToggleStepsSync(
    ToggleStepsSync event,
    Emitter<HealthSyncState> emit,
  ) {
    final currentState = state;
    if (currentState is HealthSyncLoaded) {
      emit(currentState.copyWith(stepsEnabled: event.enabled));
    }
  }

  void _onToggleWorkoutsSync(
    ToggleWorkoutsSync event,
    Emitter<HealthSyncState> emit,
  ) {
    final currentState = state;
    if (currentState is HealthSyncLoaded) {
      emit(currentState.copyWith(workoutsEnabled: event.enabled));
    }
  }

  void _onToggleWeightSync(
    ToggleWeightSync event,
    Emitter<HealthSyncState> emit,
  ) {
    final currentState = state;
    if (currentState is HealthSyncLoaded) {
      emit(currentState.copyWith(weightEnabled: event.enabled));
    }
  }
}
