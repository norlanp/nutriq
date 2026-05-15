import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

class IntakeEntity extends Equatable {
  final String id;
  final String unit;
  final double amount;
  final IntakeTypeEntity type;
  final DateTime dateTime;
  final TimeOfDay? time;

  final MealEntity meal;

  const IntakeEntity({
    required this.id,
    required this.unit,
    required this.amount,
    required this.type,
    required this.meal,
    required this.dateTime,
    this.time,
  });

  double get totalKcal => amount * (meal.nutriments.energyPerUnit ?? 0);

  double get totalCarbsGram =>
      amount * (meal.nutriments.carbohydratesPerUnit ?? 0);

  double get totalNetCarbsGram =>
      amount * (meal.nutriments.netCarbsPerUnit ?? 0);

  double get totalFatsGram => amount * (meal.nutriments.fatPerUnit ?? 0);

  double get totalProteinsGram =>
      amount * (meal.nutriments.proteinsPerUnit ?? 0);

  @override
  List<Object?> get props => [id, unit, amount, type, dateTime, time];
}
