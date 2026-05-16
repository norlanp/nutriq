// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

IntakeTypeEntity mapIntakeTypeStringToEntity(String type) {
  switch (type) {
    case 'breakfast':
      return IntakeTypeEntity.breakfast;
    case 'lunch':
      return IntakeTypeEntity.lunch;
    case 'dinner':
      return IntakeTypeEntity.dinner;
    default:
      return IntakeTypeEntity.snack;
  }
}

String mapIntakeTypeEntityToString(IntakeTypeEntity entity) {
  switch (entity) {
    case IntakeTypeEntity.breakfast:
      return 'breakfast';
    case IntakeTypeEntity.lunch:
      return 'lunch';
    case IntakeTypeEntity.dinner:
      return 'dinner';
    case IntakeTypeEntity.snack:
      return 'snack';
  }
}

MealSourceEntity mapMealSourceStringToEntity(String source) {
  switch (source) {
    case 'custom':
      return MealSourceEntity.custom;
    case 'off':
      return MealSourceEntity.off;
    case 'fdc':
      return MealSourceEntity.fdc;
    default:
      return MealSourceEntity.unknown;
  }
}

String mapMealSourceEntityToString(MealSourceEntity entity) {
  switch (entity) {
    case MealSourceEntity.unknown:
      return 'unknown';
    case MealSourceEntity.custom:
      return 'custom';
    case MealSourceEntity.off:
      return 'off';
    case MealSourceEntity.fdc:
      return 'fdc';
  }
}

MealNutrimentsEntity mapMealToNutrimentsEntity(Meal meal) =>
    MealNutrimentsEntity(
      energyKcal100: meal.energyKcal100,
      carbohydrates100: meal.carbohydrates100,
      fat100: meal.fat100,
      proteins100: meal.proteins100,
      sugars100: meal.sugars100,
      saturatedFat100: meal.saturatedFat100,
      fiber100: meal.fiber100,
      sodium100: meal.sodium100,
      potassium100: meal.potassium100,
      cholesterol100: meal.cholesterol100,
      vitaminA100: meal.vitaminA100,
      vitaminC100: meal.vitaminC100,
      vitaminD100: meal.vitaminD100,
      calcium100: meal.calcium100,
      iron100: meal.iron100,
    );

MealEntity mapMealToEntity(Meal meal) => MealEntity(
      code: meal.code,
      name: meal.name,
      brands: meal.brands,
      thumbnailImageUrl: meal.thumbnailImageUrl,
      mainImageUrl: meal.mainImageUrl,
      url: meal.url,
      mealQuantity: meal.mealQuantity,
      mealUnit: meal.mealUnit,
      servingQuantity: meal.servingQuantity,
      servingUnit: meal.servingUnit,
      servingSize: meal.servingSize,
      nutriments: mapMealToNutrimentsEntity(meal),
      source: mapMealSourceStringToEntity(meal.source),
    );

MealsCompanion mapMealEntityToCompanion(MealEntity entity) => MealsCompanion(
      id: Value(entity.code ?? ''),
      code: Value(entity.code),
      name: Value(entity.name),
      brands: Value(entity.brands),
      thumbnailImageUrl: Value(entity.thumbnailImageUrl),
      mainImageUrl: Value(entity.mainImageUrl),
      url: Value(entity.url),
      mealQuantity: Value(entity.mealQuantity),
      mealUnit: Value(entity.mealUnit),
      servingQuantity: Value(entity.servingQuantity),
      servingUnit: Value(entity.servingUnit),
      servingSize: Value(entity.servingSize),
      source: Value(mapMealSourceEntityToString(entity.source)),
      energyKcal100: Value(entity.nutriments.energyKcal100),
      carbohydrates100: Value(entity.nutriments.carbohydrates100),
      fat100: Value(entity.nutriments.fat100),
      proteins100: Value(entity.nutriments.proteins100),
      sugars100: Value(entity.nutriments.sugars100),
      saturatedFat100: Value(entity.nutriments.saturatedFat100),
      fiber100: Value(entity.nutriments.fiber100),
      sodium100: Value(entity.nutriments.sodium100),
      potassium100: Value(entity.nutriments.potassium100),
      cholesterol100: Value(entity.nutriments.cholesterol100),
      vitaminA100: Value(entity.nutriments.vitaminA100),
      vitaminC100: Value(entity.nutriments.vitaminC100),
      vitaminD100: Value(entity.nutriments.vitaminD100),
      calcium100: Value(entity.nutriments.calcium100),
      iron100: Value(entity.nutriments.iron100),
    );

int? _timeOfDayToMinutes(TimeOfDay? time) {
  if (time == null) return null;
  return time.hour * 60 + time.minute;
}

TimeOfDay? _minutesToTimeOfDay(int? minutes) {
  if (minutes == null) return null;
  return TimeOfDay(hour: minutes ~/ 60, minute: minutes % 60);
}

IntakeEntity mapIntakeToEntity(Intake intake, Meal meal) => IntakeEntity(
      id: intake.id,
      unit: intake.unit,
      amount: intake.amount,
      type: mapIntakeTypeStringToEntity(intake.type),
      meal: mapMealToEntity(meal),
      dateTime: intake.date,
      time: _minutesToTimeOfDay(intake.timeMinutes),
    );

IntakesCompanion mapIntakeEntityToCompanion(IntakeEntity entity) =>
    IntakesCompanion(
      id: Value(entity.id),
      unit: Value(entity.unit),
      amount: Value(entity.amount),
      type: Value(mapIntakeTypeEntityToString(entity.type)),
      mealId: Value(entity.meal.code ?? ''),
      date: Value(entity.dateTime),
      timeMinutes: Value(_timeOfDayToMinutes(entity.time)),
    );