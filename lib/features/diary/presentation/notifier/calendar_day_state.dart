import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

class CalendarDayState extends Equatable {
  final DateTime? currentDay;
  final TrackedDayEntity? trackedDayEntity;
  final List<UserActivityEntity> userActivityList;
  final List<IntakeEntity> breakfastIntakeList;
  final List<IntakeEntity> lunchIntakeList;
  final List<IntakeEntity> dinnerIntakeList;
  final List<IntakeEntity> snackIntakeList;
  final double burnedCalories;
  final double netCalories;

  const CalendarDayState({
    this.currentDay,
    this.trackedDayEntity,
    this.userActivityList = const [],
    this.breakfastIntakeList = const [],
    this.lunchIntakeList = const [],
    this.dinnerIntakeList = const [],
    this.snackIntakeList = const [],
    this.burnedCalories = 0,
    this.netCalories = 0,
  });

  @override
  List<Object?> get props => [
        currentDay,
        trackedDayEntity,
        userActivityList,
        breakfastIntakeList,
        lunchIntakeList,
        dinnerIntakeList,
        snackIntakeList,
        burnedCalories,
        netCalories,
      ];
}