import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class CalculateStepBonusUsecase {
  final HealthSyncService _healthSyncService;

  static const double _defaultStrideMeters = 0.762;
  static const double _caloriesPerKm = 62.0;

  CalculateStepBonusUsecase(this._healthSyncService);

  Future<double> call({
    required int steps,
    required double percent,
    double? strideLengthMeters,
  }) async {
    if (steps <= 0 || percent <= 0) return 0;

    final stride = strideLengthMeters ?? _defaultStrideMeters;
    final distanceKm = (steps * stride) / 1000.0;
    final caloriesBurned = distanceKm * _caloriesPerKm;
    final credit = caloriesBurned * percent;

    return credit;
  }

  Future<int> readTodaySteps() async {
    final now = DateTime.now();
    final startOfDay = DateTime(now.year, now.month, now.day);
    return await _healthSyncService.readSteps(startOfDay, now);
  }
}
