import 'package:nutriq/core/domain/entity/autopilot_entity.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/repository/autopilot_repository.dart';
import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/core/domain/service/autopilot_service.dart';

class AdjustBudgetUsecase {
  final AutopilotRepository _autopilotRepository;
  final WeightRepository _weightRepository;
  final AutopilotService _autopilotService;

  AdjustBudgetUsecase(
    this._autopilotRepository,
    this._weightRepository,
    this._autopilotService,
  );

  Future<AutopilotEntity> call(int userId, int baselineCalories) async {
    final now = DateTime.now();
    final fourWeeksAgo = now.subtract(const Duration(days: 28));
    final weights = await _weightRepository.getWeightsBetweenDates(
      fourWeeksAgo,
      now,
    );

    final weeklyWeights = _aggregateToWeeklyAverages(weights);

    final status =
        _autopilotService.calculateAdjustment(weeklyWeights, baselineCalories);

    final existing = await _autopilotRepository.getAutopilotSettings(userId);
    final history = List<int>.from(existing?.adjustmentHistoryKcal ?? []);
    history.add(status.adjustmentKcal);

    final entity = AutopilotEntity(
      id: existing?.id ?? 0,
      userId: userId,
      baselineCalorieBudget: baselineCalories,
      adjustedCalorieBudget: status.adjustedCalorieBudget,
      lastAdjustmentDate: now,
      adjustmentHistoryKcal: history,
      isEnabled: existing?.isEnabled ?? true,
    );
    await _autopilotRepository.saveAutopilotSettings(entity);
    return entity;
  }

  List<double> _aggregateToWeeklyAverages(List<WeightEntity> weights) {
    if (weights.isEmpty) return [];

    final Map<int, List<double>> weekBuckets = {};
    for (final w in weights) {
      final weekKey = w.date.subtract(Duration(days: w.date.weekday - 1));
      final weekMs = DateTime(
        weekKey.year,
        weekKey.month,
        weekKey.day,
      ).millisecondsSinceEpoch;
      weekBuckets.putIfAbsent(weekMs, () => []).add(w.weightKg);
    }

    final sortedKeys = weekBuckets.keys.toList()..sort();
    return sortedKeys.map((key) {
      final values = weekBuckets[key]!;
      return values.reduce((a, b) => a + b) / values.length;
    }).toList();
  }
}
