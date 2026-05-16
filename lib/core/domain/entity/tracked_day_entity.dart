import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'tracked_day_entity.freezed.dart';

enum DayRating { onTrack, offTrack }

@freezed
abstract class TrackedDayEntity with _$TrackedDayEntity {
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

  DayRating get rating {
    final difference = calorieGoal - caloriesTracked;
    if (calorieGoal < caloriesTracked) {
      return difference.abs() < maxKcalDifferenceOverGoal
          ? DayRating.onTrack
          : DayRating.offTrack;
    }
    return difference < maxKcalDifferenceUnderGoal
        ? DayRating.onTrack
        : DayRating.offTrack;
  }

  Color getCalendarDayRatingColor(BuildContext context) {
    return switch (rating) {
      DayRating.onTrack => Theme.of(context).colorScheme.primary,
      DayRating.offTrack => Theme.of(context).colorScheme.error,
    };
  }

  Color getRatingDayTextColor(BuildContext context) {
    return switch (rating) {
      DayRating.onTrack => Theme.of(context).colorScheme.onSecondaryContainer,
      DayRating.offTrack => Theme.of(context).colorScheme.onErrorContainer,
    };
  }

  Color getRatingDayTextBackgroundColor(BuildContext context) {
    return switch (rating) {
      DayRating.onTrack => Theme.of(context).colorScheme.secondaryContainer,
      DayRating.offTrack => Theme.of(context).colorScheme.errorContainer,
    };
  }
}