import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_state.dart';

class FastingNotifier extends Notifier<FastingNotifierState> {
  final _log = Logger('FastingNotifier');
  Timer? _timer;

  @override
  FastingNotifierState build() {
    return const FastingNotifierState();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      tickTimer();
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> loadActive() async {
    state = state.copyWith(status: FastingStatus.loading);
    try {
      final active = await ref.read(getActiveFastingUsecaseProvider).getActiveFast();
      if (active != null) {
        _startTimer();
        state = state.copyWith(
          status: FastingStatus.active,
          activeFast: active,
          elapsed: active.elapsed,
        );
      } else {
        state = state.copyWith(status: FastingStatus.inactive);
      }
    } catch (e) {
      _log.severe(e);
      state = state.copyWith(status: FastingStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> startFast(FastingEntity entity) async {
    try {
      await ref.read(startFastingUsecaseProvider).startFast(entity);
      final active = await ref.read(getActiveFastingUsecaseProvider).getActiveFast();
      if (active != null) {
        _startTimer();
        state = state.copyWith(
          status: FastingStatus.active,
          activeFast: active,
          elapsed: active.elapsed,
        );
      }
    } catch (e) {
      _log.severe(e);
      state = state.copyWith(status: FastingStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> endFast(int id, DateTime endTime) async {
    _stopTimer();
    try {
      await ref.read(endFastingUsecaseProvider).endFast(id, endTime);
      state = state.copyWith(status: FastingStatus.inactive, activeFast: null, elapsed: Duration.zero);
    } catch (e) {
      _log.severe(e);
      state = state.copyWith(status: FastingStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loadHistory(DateTime startDate, DateTime endDate) async {
    state = state.copyWith(status: FastingStatus.loading);
    try {
      final fasts = await ref.read(getFastingHistoryUsecaseProvider).getHistory(startDate, endDate);
      state = state.copyWith(history: fasts, status: FastingStatus.inactive);
    } catch (e) {
      _log.severe(e);
      state = state.copyWith(status: FastingStatus.error, errorMessage: e.toString());
    }
  }

  Future<void> loadStreak() async {
    try {
      final streak = await ref.read(getCurrentStreakUsecaseProvider).getCurrentStreak();
      state = state.copyWith(streak: streak);
    } catch (e) {
      _log.severe(e);
      state = state.copyWith(status: FastingStatus.error, errorMessage: e.toString());
    }
  }

  void tickTimer() {
    final activeFast = state.activeFast;
    if (activeFast != null && state.isActive) {
      state = state.copyWith(elapsed: activeFast.elapsed);
    }
  }
}

final fastingNotifierProvider =
    NotifierProvider<FastingNotifier, FastingNotifierState>(
  FastingNotifier.new,
);