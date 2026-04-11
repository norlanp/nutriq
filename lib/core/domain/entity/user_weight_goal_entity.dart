import 'package:flutter/material.dart';

import 'package:nutriq/generated/l10n.dart';

enum UserWeightGoalEntity {
  loseWeight,
  maintainWeight,
  gainWeight;

  String getName(BuildContext context) {
    String name;
    switch (this) {
      case UserWeightGoalEntity.loseWeight:
        name = S.of(context).goalLoseWeight;
        break;
      case UserWeightGoalEntity.maintainWeight:
        name = S.of(context).goalMaintainWeight;
        break;
      case UserWeightGoalEntity.gainWeight:
        name = S.of(context).goalGainWeight;
        break;
    }
    return name;
  }
}
