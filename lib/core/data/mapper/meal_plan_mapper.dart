// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';

import 'intake_mapper.dart';

MealPlanEntity mapMealPlanToEntity(MealPlan entry) => MealPlanEntity(
      id: entry.id,
      userId: entry.userId,
      date: entry.date,
      mealSlot: mapIntakeTypeStringToEntity(entry.mealSlot),
      recipeId: entry.recipeId,
      mealId: entry.mealId,
      note: entry.note,
    );

MealPlansCompanion mapMealPlanEntityToCompanion(MealPlanEntity entity) =>
    MealPlansCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      date: Value(entity.date),
      mealSlot: Value(mapIntakeTypeEntityToString(entity.mealSlot)),
      recipeId: Value(entity.recipeId),
      mealId: Value(entity.mealId),
      note: Value(entity.note),
    );