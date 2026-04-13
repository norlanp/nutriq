import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';

class AutopilotStatus {
  final int adjustedCalorieBudget;
  final double weightTrendKgPerWeek;
  final int adjustmentKcal;
  final bool sufficientData;

  const AutopilotStatus({
    required this.adjustedCalorieBudget,
    required this.weightTrendKgPerWeek,
    required this.adjustmentKcal,
    required this.sufficientData,
  });
}

abstract class AutopilotService {
  AutopilotStatus calculateAdjustment(
    List<double> weeklyWeights,
    int baselineCalories,
  );

  int calculateExerciseCredit({
    required int burnedCalories,
    required ExerciseCalorieModeEntity exerciseCalorieMode,
    required double exerciseCreditPercent,
  });
}

class AutopilotServiceImpl implements AutopilotService {
  static const double _expectedRateKgPerWeek = 0.5;
  static const double _deviationStepKg = 0.1;
  static const int _adjustmentStepKcal = 100;
  static const int _maxAdjustmentKcal = 500;

  @override
  AutopilotStatus calculateAdjustment(
    List<double> weeklyWeights,
    int baselineCalories,
  ) {
    if (weeklyWeights.length < 2) {
      return AutopilotStatus(
        adjustedCalorieBudget: baselineCalories,
        weightTrendKgPerWeek: 0,
        adjustmentKcal: 0,
        sufficientData: false,
      );
    }

    final trend = _linearRegressionSlope(weeklyWeights);
    final deviation = trend - _expectedRateKgPerWeek;
    final steps = (deviation / _deviationStepKg).round();
    var adjustment = steps * _adjustmentStepKcal;

    if (adjustment > _maxAdjustmentKcal) {
      adjustment = _maxAdjustmentKcal;
    } else if (adjustment < -_maxAdjustmentKcal) {
      adjustment = -_maxAdjustmentKcal;
    }

    return AutopilotStatus(
      adjustedCalorieBudget: baselineCalories + adjustment,
      weightTrendKgPerWeek: trend,
      adjustmentKcal: adjustment,
      sufficientData: true,
    );
  }

  @override
  int calculateExerciseCredit({
    required int burnedCalories,
    required ExerciseCalorieModeEntity exerciseCalorieMode,
    required double exerciseCreditPercent,
  }) {
    if (burnedCalories <= 0) return 0;

    switch (exerciseCalorieMode) {
      case ExerciseCalorieModeEntity.none:
        return 0;
      case ExerciseCalorieModeEntity.half:
        return (burnedCalories * 0.5).round();
      case ExerciseCalorieModeEntity.full:
        return burnedCalories;
      case ExerciseCalorieModeEntity.custom:
        return (burnedCalories * exerciseCreditPercent).round();
    }
  }

  double _linearRegressionSlope(List<double> values) {
    final n = values.length;
    if (n < 2) return 0;

    double sumX = 0;
    double sumY = 0;
    double sumXY = 0;
    double sumX2 = 0;

    for (var i = 0; i < n; i++) {
      final x = i.toDouble();
      sumX += x;
      sumY += values[i];
      sumXY += x * values[i];
      sumX2 += x * x;
    }

    final denominator = n * sumX2 - sumX * sumX;
    if (denominator == 0) return 0;

    return (n * sumXY - sumX * sumY) / denominator;
  }
}
