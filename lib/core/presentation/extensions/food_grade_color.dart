import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/food_grade.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';

extension FoodGradeColorX on FoodGrade {
  Color color(BuildContext context) {
    final nc = context.nutriqColors;
    switch (this) {
      case FoodGrade.a:
        return nc.success;
      case FoodGrade.b:
        return nc.successContainer;
      case FoodGrade.c:
        return nc.warning;
      case FoodGrade.d:
        return Theme.of(context).colorScheme.error;
    }
  }

  Color onColor(BuildContext context) {
    final nc = context.nutriqColors;
    switch (this) {
      case FoodGrade.a:
        return nc.onSuccess;
      case FoodGrade.b:
        return nc.onSuccess;
      case FoodGrade.c:
        return nc.onWarning;
      case FoodGrade.d:
        return Theme.of(context).colorScheme.onError;
    }
  }
}