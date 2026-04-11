import 'package:flutter/material.dart';

import 'package:nutriq/core/utils/custom_icons.dart';

enum IntakeTypeEntity {
  breakfast,
  lunch,
  dinner,
  snack;

  IconData getIconData() {
    IconData icon;
    switch (this) {
      case IntakeTypeEntity.breakfast:
        icon = Icons.bakery_dining_outlined;
        break;
      case IntakeTypeEntity.lunch:
        icon = Icons.lunch_dining_outlined;
        break;
      case IntakeTypeEntity.dinner:
        icon = Icons.dinner_dining_outlined;
        break;
      case IntakeTypeEntity.snack:
        icon = CustomIcons.food_apple_outline;
    }
    return icon;
  }
}
