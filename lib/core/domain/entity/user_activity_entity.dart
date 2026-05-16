import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

part 'user_activity_entity.freezed.dart';

@freezed
class UserActivityEntity with _$UserActivityEntity {
  const factory UserActivityEntity({
    required String id,
    required double duration,
    required double burnedKcal,
    required DateTime date,
    required PhysicalActivityEntity physicalActivityEntity,
  }) = _UserActivityEntity;

  const UserActivityEntity._();

  static getIconData() => Icons.directions_run_outlined;
}