import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

abstract class PhysicalActivityRepository {
  Future<List<PhysicalActivityEntity>> getAllPhysicalActivities();
}
