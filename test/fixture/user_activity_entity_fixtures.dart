import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

import 'physical_activity_entity_fixtures.dart';

class UserActivityEntityFixtures {
  static UserActivityEntity activityOne = UserActivityEntity(
    "act-1",
    60,
    400,
    DateTime.utc(2024, 1, 1),
    PhysicalActivityFixtures.moderateBicycling,
  );

  static UserActivityEntity activityTwo = UserActivityEntity(
    "act-2",
    30,
    150,
    DateTime.utc(2024, 1, 1),
    PhysicalActivityFixtures.lightDancing,
  );

  static UserActivityEntity activityThree = UserActivityEntity(
    "act-3",
    45,
    675,
    DateTime.utc(2024, 1, 2),
    PhysicalActivityFixtures.vigorousRunning,
  );
}
