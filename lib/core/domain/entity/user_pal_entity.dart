import 'package:flutter/material.dart';

import 'package:nutriq/generated/l10n.dart';

enum UserPALEntity {
  sedentary,
  lowActive,
  active,
  veryActive,
  extraActive;

  String getName(BuildContext context) {
    String name;
    switch (this) {
      case UserPALEntity.sedentary:
        name = S.of(context).palSedentaryLabel;
        break;
      case UserPALEntity.lowActive:
        name = S.of(context).palLowLActiveLabel;
        break;
      case UserPALEntity.active:
        name = S.of(context).palActiveLabel;
        break;
      case UserPALEntity.veryActive:
        name = S.of(context).palVeryActiveLabel;
        break;
      case UserPALEntity.extraActive:
        name = S.of(context).palExtraActiveLabel;
        break;
    }
    return name;
  }
}
