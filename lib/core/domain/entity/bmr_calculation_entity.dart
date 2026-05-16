import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';

part 'bmr_calculation_entity.freezed.dart';

@freezed
abstract class BMRCalculationEntity with _$BMRCalculationEntity {
  const factory BMRCalculationEntity({
    required double bmr,
    required double tdee,
    required double activityMultiplier,
    required UserPALEntity activityLevel,
    required TDEEMethodEntity method,
  }) = _BMRCalculationEntity;

  const BMRCalculationEntity._();
}