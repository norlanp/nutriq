import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

import 'physical_activity_entity_fixtures.dart';

class UserActivityEntityFixtures {
  static UserActivityEntity activityOne = UserActivityEntity(
    id: "act-1",
    duration: 60,
    burnedKcal: 400,
    date: DateTime.utc(2024, 1, 1),
    physicalActivityEntity: PhysicalActivityFixtures.moderateBicycling,
  );

  static UserActivityEntity activityTwo = UserActivityEntity(
    id: "act-2",
    duration: 30,
    burnedKcal: 150,
    date: DateTime.utc(2024, 1, 1),
    physicalActivityEntity: PhysicalActivityFixtures.lightDancing,
  );

  static UserActivityEntity activityThree = UserActivityEntity(
    id: "act-3",
    duration: 45,
    burnedKcal: 675,
    date: DateTime.utc(2024, 1, 2),
    physicalActivityEntity: PhysicalActivityFixtures.vigorousRunning,
  );
}
