import 'package:equatable/equatable.dart';

import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';

class BMRCalculationEntity extends Equatable {
  final double bmr;
  final double tdee;
  final double activityMultiplier;
  final UserPALEntity activityLevel;
  final TDEEMethodEntity method;

  const BMRCalculationEntity({
    required this.bmr,
    required this.tdee,
    required this.activityMultiplier,
    required this.activityLevel,
    required this.method,
  });

  @override
  List<Object?> get props =>
      [bmr, tdee, activityMultiplier, activityLevel, method];
}
