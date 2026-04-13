import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart';

class DeleteCustomTrackerUsecase {
  final CustomTrackerRepository _repository;

  DeleteCustomTrackerUsecase(this._repository);

  Future<void> call(int id) => _repository.deleteTracker(id);
}
