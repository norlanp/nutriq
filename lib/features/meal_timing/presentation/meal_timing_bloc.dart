import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show TimeOfDay;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_all_intakes_ordered_by_time_usecase.dart';

part 'meal_timing_event.dart';
part 'meal_timing_state.dart';

class MealTimingBloc extends Bloc<MealTimingEvent, MealTimingState> {
  final GetAllIntakesOrderedByTimeUsecase _getAllIntakesOrderedByTime;

  MealTimingBloc(this._getAllIntakesOrderedByTime)
      : super(MealTimingInitial()) {
    on<LoadMealTimingWeek>((event, emit) async {
      emit(MealTimingLoading());
      try {
        final allIntakes = await _getAllIntakesOrderedByTime.call();
        final weekIntakes = <IntakeEntity>[];
        for (final intake in allIntakes) {
          final diff = event.startDate.difference(intake.dateTime).inDays;
          if (diff >= 0 && diff < 7) {
            weekIntakes.add(intake);
          }
        }
        final avgMealTimes = _computeAvgMealTimes(weekIntakes);
        final mealTimeDistribution = _computeMealTimeDistribution(weekIntakes);
        emit(MealTimingLoaded(
          intakes: weekIntakes,
          avgMealTimes: avgMealTimes,
          mealTimeDistribution: mealTimeDistribution,
          startDate: event.startDate,
        ));
      } catch (e) {
        emit(MealTimingError(e.toString()));
      }
    });
  }

  Map<IntakeTypeEntity, TimeOfDay> _computeAvgMealTimes(
      List<IntakeEntity> intakes) {
    final byType = <IntakeTypeEntity, List<TimeOfDay>>{};
    for (final intake in intakes) {
      if (intake.time != null) {
        byType.putIfAbsent(intake.type, () => []).add(intake.time!);
      }
    }
    final result = <IntakeTypeEntity, TimeOfDay>{};
    byType.forEach((type, times) {
      if (times.isNotEmpty) {
        final avgMinutes = times.map((t) => t.hour * 60 + t.minute).reduce(
                  (a, b) => a + b,
                ) /
            times.length;
        result[type] = TimeOfDay(
          hour: (avgMinutes ~/ 60).toInt(),
          minute: (avgMinutes.round() % 60),
        );
      }
    });
    return result;
  }

  Map<IntakeTypeEntity, List<TimeOfDay>> _computeMealTimeDistribution(
      List<IntakeEntity> intakes) {
    final result = <IntakeTypeEntity, List<TimeOfDay>>{};
    for (final intake in intakes) {
      if (intake.time != null) {
        result.putIfAbsent(intake.type, () => []).add(intake.time!);
      }
    }
    return result;
  }
}
