import 'package:flutter/material.dart' show TimeOfDay;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/meal_timing/presentation/notifier/meal_timing_state.dart';

class MealTimingNotifier extends Notifier<MealTimingState> {
  @override
  MealTimingState build() => const MealTimingState();

  Future<void> loadMealTimingWeek(DateTime startDate) async {
    state = const MealTimingState(isLoading: true);
    try {
      final allIntakes = await ref.read(getAllIntakesOrderedByTimeUsecaseProvider).call();
      final weekIntakes = <IntakeEntity>[];
      for (final intake in allIntakes) {
        final diff = startDate.difference(intake.dateTime).inDays;
        if (diff >= 0 && diff < 7) {
          weekIntakes.add(intake);
        }
      }
      final avgMealTimes = _computeAvgMealTimes(weekIntakes);
      final mealTimeDistribution = _computeMealTimeDistribution(weekIntakes);
      state = MealTimingState(
        intakes: weekIntakes,
        avgMealTimes: avgMealTimes,
        mealTimeDistribution: mealTimeDistribution,
        startDate: startDate,
        isLoaded: true,
      );
    } catch (e) {
      state = MealTimingState(errorMessage: e.toString());
    }
  }

  Map<IntakeTypeEntity, TimeOfDay> _computeAvgMealTimes(List<IntakeEntity> intakes) {
    final byType = <IntakeTypeEntity, List<TimeOfDay>>{};
    for (final intake in intakes) {
      if (intake.time != null) {
        byType.putIfAbsent(intake.type, () => []).add(intake.time!);
      }
    }
    final result = <IntakeTypeEntity, TimeOfDay>{};
    byType.forEach((type, times) {
      if (times.isNotEmpty) {
        final avgMinutes =
            times.map((t) => t.hour * 60 + t.minute).reduce((a, b) => a + b) /
                times.length;
        result[type] = TimeOfDay(
          hour: (avgMinutes ~/ 60).toInt(),
          minute: (avgMinutes.round() % 60),
        );
      }
    });
    return result;
  }

  Map<IntakeTypeEntity, List<TimeOfDay>> _computeMealTimeDistribution(List<IntakeEntity> intakes) {
    final result = <IntakeTypeEntity, List<TimeOfDay>>{};
    for (final intake in intakes) {
      if (intake.time != null) {
        result.putIfAbsent(intake.type, () => []).add(intake.time!);
      }
    }
    return result;
  }
}

final mealTimingNotifierProvider =
    NotifierProvider<MealTimingNotifier, MealTimingState>(MealTimingNotifier.new);