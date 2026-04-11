import 'package:nutriq/core/data/data_source/physical_activity_data_source.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/repository/physical_activity_repository.dart'
    as domain;

class PhysicalActivityRepository implements domain.PhysicalActivityRepository {
  final PhysicalActivityDataSource _physicalActivityDataSource;

  PhysicalActivityRepository(this._physicalActivityDataSource);

  @override
  Future<List<PhysicalActivityEntity>> getAllPhysicalActivities() async {
    return _physicalActivityDataSource.getPhysicalActivityList();
  }
}
