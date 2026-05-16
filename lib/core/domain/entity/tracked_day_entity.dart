import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'tracked_day_entity.freezed.dart';

@freezed
class TrackedDayEntity with _$TrackedDayEntity {
  static const maxKcalDifferenceOverGoal = 500;
  static const maxKcalDifferenceUnderGoal = 1000;

  const factory TrackedDayEntity({
    required DateTime day,
    required double calorieGoal,
    required double caloriesTracked,
    double? carbsGoal,
    double? carbsTracked,
    double? fatGoal,
    double? fatTracked,
    double? proteinGoal,
    double? proteinTracked,
  }) = _TrackedDayEntity;

  const TrackedDayEntity._();

  // TODO: make enum class for rating
  Color getCalendarDayRatingColor(BuildContext context) {
    if (_hasExceededMaxKcalDifferenceGoal(calorieGoal, caloriesTracked)) {
      return Theme.of(context).colorScheme.primary;
    } else {
      return Theme.of(context).colorScheme.error;
    }
  }

  Color getRatingDayTextColor(BuildContext context) {
    if (_hasExceededMaxKcalDifferenceGoal(calorieGoal, caloriesTracked)) {
      return Theme.of(context).colorScheme.onSecondaryContainer;
    } else {
      return Theme.of(context).colorScheme.onErrorContainer;
    }
  }

  Color getRatingDayTextBackgroundColor(BuildContext context) {
    if (_hasExceededMaxKcalDifferenceGoal(calorieGoal, caloriesTracked)) {
      return Theme.of(context).colorScheme.secondaryContainer;
    } else {
      return Theme.of(context).colorScheme.errorContainer;
    }
  }

  bool _hasExceededMaxKcalDifferenceGoal(
      double calorieGoal, double caloriesTracked) {
    double difference = calorieGoal - caloriesTracked;

    if (calorieGoal < caloriesTracked) {
      return difference.abs() < maxKcalDifferenceOverGoal;
    } else {
      return difference < maxKcalDifferenceUnderGoal;
    }
  }
}