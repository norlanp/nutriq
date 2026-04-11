import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

class UserActivityEntity extends Equatable {
  final String id;
  final double duration;
  final double burnedKcal;
  final DateTime date;

  final PhysicalActivityEntity physicalActivityEntity;

  const UserActivityEntity(
    this.id,
    this.duration,
    this.burnedKcal,
    this.date,
    this.physicalActivityEntity,
  );

  @override
  List<Object?> get props => [id, duration, burnedKcal, date];

  static getIconData() => Icons.directions_run_outlined;
}
