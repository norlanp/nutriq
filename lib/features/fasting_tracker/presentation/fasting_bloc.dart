import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/usecase/fasting/end_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_active_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_current_streak_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_fasting_history_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/start_fasting_usecase.dart';
import 'package:nutriq/features/notifications/data/notification_scheduler.dart';

part 'fasting_event.dart';
part 'fasting_state.dart';

class FastingBloc extends Bloc<FastingEvent, FastingState> {
  final StartFastingUsecase _startFastingUsecase;
  final EndFastingUsecase _endFastingUsecase;
  final GetActiveFastingUsecase _getActiveFastingUsecase;
  final GetCurrentStreakUsecase _getCurrentStreakUsecase;
  final GetFastingHistoryUsecase _getFastingHistoryUsecase;
  final NotificationScheduler? _notificationScheduler;

  Timer? _timer;

  FastingBloc(
    this._startFastingUsecase,
    this._endFastingUsecase,
    this._getActiveFastingUsecase,
    this._getCurrentStreakUsecase,
    this._getFastingHistoryUsecase,
    this._notificationScheduler,
  ) : super(FastingInitial()) {
    on<StartFast>(_onStartFast);
    on<EndFast>(_onEndFast);
    on<LoadActive>(_onLoadActive);
    on<LoadHistory>(_onLoadHistory);
    on<LoadStreak>(_onLoadStreak);
    on<TickTimer>(_onTickTimer);
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(TickTimer());
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _onStartFast(
    StartFast event,
    Emitter<FastingState> emit,
  ) async {
    try {
      await _startFastingUsecase.startFast(event.entity);
      final active = await _getActiveFastingUsecase.getActiveFast();
      if (active != null) {
        _startTimer();
        final endTime = active.startTime.add(
          Duration(minutes: active.targetDurationMinutes),
        );
        await _notificationScheduler?.scheduleFastingEndNotification(endTime);
        emit(FastingActive(
          fast: active,
          elapsed: active.elapsed,
        ));
      }
    } catch (e) {
      emit(FastingError(e.toString()));
    }
  }

  Future<void> _onEndFast(
    EndFast event,
    Emitter<FastingState> emit,
  ) async {
    _stopTimer();
    try {
      await _endFastingUsecase.endFast(event.id, event.endTime);
      await _notificationScheduler?.cancelFastingNotifications();
      emit(FastingInactive());
    } catch (e) {
      emit(FastingError(e.toString()));
    }
  }

  Future<void> _onLoadActive(
    LoadActive event,
    Emitter<FastingState> emit,
  ) async {
    emit(FastingLoading());
    try {
      final active = await _getActiveFastingUsecase.getActiveFast();
      if (active != null) {
        _startTimer();
        emit(FastingActive(
          fast: active,
          elapsed: active.elapsed,
        ));
      } else {
        emit(FastingInactive());
      }
    } catch (e) {
      emit(FastingError(e.toString()));
    }
  }

  Future<void> _onLoadHistory(
    LoadHistory event,
    Emitter<FastingState> emit,
  ) async {
    emit(FastingLoading());
    try {
      final fasts = await _getFastingHistoryUsecase.getHistory(
        event.startDate,
        event.endDate,
      );
      emit(FastingHistoryLoaded(fasts: fasts));
    } catch (e) {
      emit(FastingError(e.toString()));
    }
  }

  Future<void> _onLoadStreak(
    LoadStreak event,
    Emitter<FastingState> emit,
  ) async {
    try {
      final streak = await _getCurrentStreakUsecase.getCurrentStreak();
      emit(FastingStreakLoaded(streak: streak));
    } catch (e) {
      emit(FastingError(e.toString()));
    }
  }

  void _onTickTimer(
    TickTimer event,
    Emitter<FastingState> emit,
  ) {
    final currentState = state;
    if (currentState is FastingActive) {
      emit(FastingActive(
        fast: currentState.fast,
        elapsed: currentState.fast.elapsed,
      ));
    }
  }

  @override
  Future<void> close() {
    _stopTimer();
    return super.close();
  }
}
