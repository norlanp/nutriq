// ignore_for_file: directives_ordering

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

PhysicalActivityTypeEntity mapPhysicalActivityTypeStringToEntity(String type) {
  switch (type) {
    case 'bicycling':
      return PhysicalActivityTypeEntity.bicycling;
    case 'conditioningExercise':
      return PhysicalActivityTypeEntity.conditioningExercise;
    case 'dancing':
      return PhysicalActivityTypeEntity.dancing;
    case 'running':
      return PhysicalActivityTypeEntity.running;
    case 'waterActivities':
      return PhysicalActivityTypeEntity.waterActivities;
    case 'winterActivities':
      return PhysicalActivityTypeEntity.winterActivities;
    default:
      return PhysicalActivityTypeEntity.sport;
  }
}

String mapPhysicalActivityTypeEntityToString(
    PhysicalActivityTypeEntity entity) {
  switch (entity) {
    case PhysicalActivityTypeEntity.bicycling:
      return 'bicycling';
    case PhysicalActivityTypeEntity.conditioningExercise:
      return 'conditioningExercise';
    case PhysicalActivityTypeEntity.dancing:
      return 'dancing';
    case PhysicalActivityTypeEntity.running:
      return 'running';
    case PhysicalActivityTypeEntity.sport:
      return 'sport';
    case PhysicalActivityTypeEntity.waterActivities:
      return 'waterActivities';
    case PhysicalActivityTypeEntity.winterActivities:
      return 'winterActivities';
  }
}

PhysicalActivityEntity mapPhysicalActivityToEntity(
  String code,
  String specificActivity,
  String description,
  double mets,
  List<String> tags,
  String type,
) =>
    PhysicalActivityEntity(
      code,
      specificActivity,
      description,
      mets,
      tags,
      mapPhysicalActivityTypeStringToEntity(type),
    );

UserActivityEntity mapUserActivityToEntity(UserActivity ua) {
  final paEntity = PhysicalActivityEntity(
    ua.physicalActivityCode,
    '',
    '',
    0,
    [],
    PhysicalActivityTypeEntity.sport,
  );
  return UserActivityEntity(
    ua.id,
    ua.duration,
    ua.burnedKcal,
    ua.date,
    paEntity,
  );
}

UserActivitiesCompanion mapUserActivityEntityToCompanion(
  UserActivityEntity entity,
) =>
    UserActivitiesCompanion.insert(
      id: entity.id,
      duration: entity.duration,
      burnedKcal: entity.burnedKcal,
      date: entity.date,
      physicalActivityCode: entity.physicalActivityEntity.code,
    );