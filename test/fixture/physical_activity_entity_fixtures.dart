import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

class PhysicalActivityFixtures {
  static const PhysicalActivityEntity moderateBicycling =
      PhysicalActivityEntity(
          code: "01015",
          specificActivity: "Bicycling, moderate speed",
          description: "Bicycling at a moderate speed on flat terrain",
          mets: 8.0,
          tags: [],
          type: PhysicalActivityTypeEntity.bicycling);

  static const PhysicalActivityEntity lightDancing = PhysicalActivityEntity(
      code: "03015",
      specificActivity: "Dancing, light effort",
      description: "Dancing with light effort, e.g., slow ballroom dancing",
      mets: 4.0,
      tags: [],
      type: PhysicalActivityTypeEntity.dancing);

  static const PhysicalActivityEntity vigorousRunning = PhysicalActivityEntity(
      code: "12150",
      specificActivity: "Running, vigorous effort",
      description: "Running at a fast pace",
      mets: 12.0,
      tags: [],
      type: PhysicalActivityTypeEntity.running);
}