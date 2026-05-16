import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/water_tracking/presentation/notifier/water_state.dart';

class WaterNotifier extends Notifier<WaterNotifierState> {
  final _log = Logger('WaterNotifier');

  @override
  WaterNotifierState build() {
    return const WaterNotifierState();
  }

  Future<void> loadWater(DateTime date, {int dailyGoal = 2000}) async {
    state = const WaterNotifierState(isLoading: true);
    try {
      final entries = await ref.read(getWaterUsecaseProvider).getWaterByDate(date);
      final total = await ref.read(getDailyWaterTotalUsecaseProvider).getDailyTotal(date);
      state = WaterNotifierState(entries: entries, dailyTotal: total, dailyGoal: dailyGoal);
    } catch (e) {
      _log.severe(e);
      state = WaterNotifierState(errorMessage: e.toString(), dailyGoal: dailyGoal);
    }
  }

  Future<void> addWater(WaterEntity entry, DateTime date, {int dailyGoal = 2000}) async {
    try {
      await ref.read(addWaterUsecaseProvider).addWater(entry);
      await _reload(date, dailyGoal: dailyGoal);
    } catch (e) {
      _log.severe(e);
      state = WaterNotifierState(errorMessage: e.toString(), dailyGoal: dailyGoal);
    }
  }

  Future<void> deleteWater(WaterEntity entry, DateTime date, {int dailyGoal = 2000}) async {
    try {
      await ref.read(deleteWaterUsecaseProvider).deleteWater(entry);
      await _reload(date, dailyGoal: dailyGoal);
    } catch (e) {
      _log.severe(e);
      state = WaterNotifierState(errorMessage: e.toString(), dailyGoal: dailyGoal);
    }
  }

  void updateDailyGoal(int dailyGoal) {
    state = state.copyWith(dailyGoal: dailyGoal);
  }

  Future<void> _reload(DateTime date, {int dailyGoal = 2000}) async {
    final entries = await ref.read(getWaterUsecaseProvider).getWaterByDate(date);
    final total = await ref.read(getDailyWaterTotalUsecaseProvider).getDailyTotal(date);
    state = WaterNotifierState(entries: entries, dailyTotal: total, dailyGoal: dailyGoal);
  }
}

final waterNotifierProvider =
    NotifierProvider<WaterNotifier, WaterNotifierState>(
  WaterNotifier.new,
);