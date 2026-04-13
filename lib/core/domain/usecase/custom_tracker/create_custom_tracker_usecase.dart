import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart';

class CreateCustomTrackerUsecase {
  final CustomTrackerRepository _repository;

  CreateCustomTrackerUsecase(this._repository);

  Future<void> call(CustomTrackerEntity entity) =>
      _repository.createTracker(entity);
}
