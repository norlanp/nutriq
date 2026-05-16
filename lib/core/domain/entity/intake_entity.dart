import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';

part 'intake_entity.freezed.dart';

@freezed
abstract class IntakeEntity with _$IntakeEntity {
  const factory IntakeEntity({
    required String id,
    required String unit,
    required double amount,
    required IntakeTypeEntity type,
    required MealEntity meal,
    required DateTime dateTime,
    TimeOfDay? time,
  }) = _IntakeEntity;

  const IntakeEntity._();

  double get totalKcal => amount * (meal.nutriments.energyPerUnit ?? 0);

  double get totalCarbsGram =>
      amount * (meal.nutriments.carbohydratesPerUnit ?? 0);

  double get totalNetCarbsGram =>
      amount * (meal.nutriments.netCarbsPerUnit ?? 0);

  double get totalFatsGram => amount * (meal.nutriments.fatPerUnit ?? 0);

  double get totalProteinsGram =>
      amount * (meal.nutriments.proteinsPerUnit ?? 0);
}