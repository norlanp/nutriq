import 'package:flutter/material.dart';

import 'package:nutriq/generated/l10n.dart';

enum TDEEMethodEntity {
  iom2005,
  mifflinStJeor;

  String getName(BuildContext context) {
    String name;
    switch (this) {
      case TDEEMethodEntity.iom2005:
        name = S.of(context).calculationsTDEEIOM2006Label;
        break;
      case TDEEMethodEntity.mifflinStJeor:
        name = S.of(context).calculationsTDEEMifflinStJeorLabel;
        break;
    }
    return name;
  }
}
