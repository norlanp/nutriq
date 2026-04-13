import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/create_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/delete_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/log_tracker_entry_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/get_tracker_entries_usecase.dart';

part 'custom_tracker_event.dart';
part 'custom_tracker_state.dart';

class CustomTrackerBloc extends Bloc<CustomTrackerEvent, CustomTrackerState> {
  final CustomTrackerRepository _repository;
  final CreateCustomTrackerUsecase _createTrackerUsecase;
  final DeleteCustomTrackerUsecase _deleteTrackerUsecase;
  final LogTrackerEntryUsecase _logEntryUsecase;
  final GetTrackerEntriesUsecase _getEntriesUsecase;

  CustomTrackerBloc(
    this._repository,
    this._createTrackerUsecase,
    this._deleteTrackerUsecase,
    this._logEntryUsecase,
    this._getEntriesUsecase,
  ) : super(CustomTrackerInitial()) {
    on<LoadTrackers>(_onLoadTrackers);
    on<CreateTracker>(_onCreateTracker);
    on<DeleteTracker>(_onDeleteTracker);
    on<LogEntry>(_onLogEntry);
    on<LoadEntries>(_onLoadEntries);
  }

  Future<void> _onLoadTrackers(
    LoadTrackers event,
    Emitter<CustomTrackerState> emit,
  ) async {
    emit(CustomTrackerLoading());
    try {
      final trackers = await _repository.getTrackersForUser(event.userId);
      final entries =
          await _getEntriesUsecase.getByDate(event.date ?? DateTime.now());
      emit(CustomTrackerLoaded(trackers: trackers, entries: entries));
    } catch (e) {
      emit(CustomTrackerError(e.toString()));
    }
  }

  Future<void> _onCreateTracker(
    CreateTracker event,
    Emitter<CustomTrackerState> emit,
  ) async {
    try {
      await _createTrackerUsecase(event.entity);
      final trackers =
          await _repository.getTrackersForUser(event.entity.userId);
      final currentState = state;
      final entries = currentState is CustomTrackerLoaded
          ? currentState.entries
          : <CustomTrackerEntryEntity>[];
      emit(CustomTrackerLoaded(trackers: trackers, entries: entries));
    } catch (e) {
      emit(CustomTrackerError(e.toString()));
    }
  }

  Future<void> _onDeleteTracker(
    DeleteTracker event,
    Emitter<CustomTrackerState> emit,
  ) async {
    try {
      await _deleteTrackerUsecase(event.id);
      final currentState = state;
      if (currentState is CustomTrackerLoaded) {
        final trackers =
            currentState.trackers.where((t) => t.id != event.id).toList();
        emit(CustomTrackerLoaded(
            trackers: trackers, entries: currentState.entries));
      }
    } catch (e) {
      emit(CustomTrackerError(e.toString()));
    }
  }

  Future<void> _onLogEntry(
    LogEntry event,
    Emitter<CustomTrackerState> emit,
  ) async {
    try {
      await _logEntryUsecase(event.entity);
      final currentState = state;
      if (currentState is CustomTrackerLoaded) {
        final date = event.entity.date;
        final entries = await _getEntriesUsecase.getByDate(date);
        emit(CustomTrackerLoaded(
            trackers: currentState.trackers, entries: entries));
      }
    } catch (e) {
      emit(CustomTrackerError(e.toString()));
    }
  }

  Future<void> _onLoadEntries(
    LoadEntries event,
    Emitter<CustomTrackerState> emit,
  ) async {
    try {
      final entries = await _getEntriesUsecase.getByDate(event.date);
      final currentState = state;
      final trackers = currentState is CustomTrackerLoaded
          ? currentState.trackers
          : <CustomTrackerEntity>[];
      emit(CustomTrackerLoaded(trackers: trackers, entries: entries));
    } catch (e) {
      emit(CustomTrackerError(e.toString()));
    }
  }
}
