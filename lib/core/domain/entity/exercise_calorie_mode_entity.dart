import 'package:flutter/material.dart';
import 'package:nutriq/generated/l10n.dart';

enum ExerciseCalorieModeEntity {
  none,
  half,
  full,
  custom;

  String getName(BuildContext context) {
    switch (this) {
      case ExerciseCalorieModeEntity.none:
        return S.of(context).exerciseCreditNone;
      case ExerciseCalorieModeEntity.half:
        return S.of(context).exerciseCredit50;
      case ExerciseCalorieModeEntity.full:
        return S.of(context).exerciseCredit100;
      case ExerciseCalorieModeEntity.custom:
        return S.of(context).exerciseCreditCustom;
    }
  }

  double get defaultPercent {
    switch (this) {
      case ExerciseCalorieModeEntity.none:
        return 0.0;
      case ExerciseCalorieModeEntity.half:
        return 0.5;
      case ExerciseCalorieModeEntity.full:
        return 1.0;
      case ExerciseCalorieModeEntity.custom:
        return 0.5;
    }
  }
}
