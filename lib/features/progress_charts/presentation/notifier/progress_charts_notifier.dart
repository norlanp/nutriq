import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/progress_charts/presentation/notifier/progress_charts_state.dart';

class ProgressChartsNotifier extends Notifier<ProgressChartsState> {
  @override
  ProgressChartsState build() {
    return ProgressChartsState(startDate: DateTime.now());
  }

  DateTime _startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);
  DateTime _endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59);

  Future<void> loadWeeklyData(DateTime startDate) async {
    state = ProgressChartsState(startDate: startDate, isLoading: true, viewMode: ViewMode.weekly);
    try {
      final trackedDays =
          await ref.read(getWeeklyNutritionUsecaseProvider).getWeeklyNutrition(startDate);
      final endOfWeek = startDate.add(const Duration(days: 6));
      final weights = await ref.read(getWeightsInRangeUsecaseProvider).getWeightsInRange(
        _startOfDay(startDate),
        _endOfDay(endOfWeek),
      );
      state = ProgressChartsState(
        trackedDays: trackedDays,
        weights: weights,
        startDate: startDate,
        viewMode: ViewMode.weekly,
      );
    } catch (e) {
      state = ProgressChartsState(startDate: startDate, viewMode: ViewMode.weekly, errorMessage: e.toString());
    }
  }

  Future<void> loadMonthlyData(int year, int month) async {
    final startOfMonth = DateTime(year, month, 1);
    state = ProgressChartsState(startDate: startOfMonth, isLoading: true, viewMode: ViewMode.monthly);
    try {
      final trackedDays = await ref.read(getMonthlyNutritionUsecaseProvider).getMonthlyNutrition(year, month);
      final endOfMonth = DateTime(year, month + 1, 0);
      final weights = await ref.read(getWeightsInRangeUsecaseProvider).getWeightsInRange(
        _startOfDay(startOfMonth),
        _endOfDay(endOfMonth),
      );
      state = ProgressChartsState(
        trackedDays: trackedDays,
        weights: weights,
        startDate: startOfMonth,
        viewMode: ViewMode.monthly,
      );
    } catch (e) {
      state = ProgressChartsState(startDate: startOfMonth, viewMode: ViewMode.monthly, errorMessage: e.toString());
    }
  }
}

final progressChartsNotifierProvider =
    NotifierProvider<ProgressChartsNotifier, ProgressChartsState>(ProgressChartsNotifier.new);