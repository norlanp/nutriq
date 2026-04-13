import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart';

class LogTrackerEntryUsecase {
  final CustomTrackerRepository _repository;

  LogTrackerEntryUsecase(this._repository);

  Future<void> call(CustomTrackerEntryEntity entity) =>
      _repository.logEntry(entity);
}
