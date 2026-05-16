import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart' show TimeOfDay;
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';

class MealTimingState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<IntakeEntity> intakes;
  final Map<IntakeTypeEntity, TimeOfDay> avgMealTimes;
  final Map<IntakeTypeEntity, List<TimeOfDay>> mealTimeDistribution;
  final DateTime? startDate;
  final bool isLoaded;

  const MealTimingState({
    this.isLoading = false,
    this.errorMessage,
    this.intakes = const [],
    this.avgMealTimes = const {},
    this.mealTimeDistribution = const {},
    this.startDate,
    this.isLoaded = false,
  });

  bool get hasError => errorMessage != null;

  MealTimingState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<IntakeEntity>? intakes,
    Map<IntakeTypeEntity, TimeOfDay>? avgMealTimes,
    Map<IntakeTypeEntity, List<TimeOfDay>>? mealTimeDistribution,
    DateTime? startDate,
    bool? isLoaded,
  }) {
    return MealTimingState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      intakes: intakes ?? this.intakes,
      avgMealTimes: avgMealTimes ?? this.avgMealTimes,
      mealTimeDistribution: mealTimeDistribution ?? this.mealTimeDistribution,
      startDate: startDate ?? this.startDate,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, intakes, avgMealTimes, mealTimeDistribution, startDate, isLoaded];
}