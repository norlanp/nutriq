import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart';

class GetTrackerEntriesUsecase {
  final CustomTrackerRepository _repository;

  GetTrackerEntriesUsecase(this._repository);

  Future<List<CustomTrackerEntryEntity>> getByDate(DateTime date) =>
      _repository.getEntriesByDate(date);

  Future<List<CustomTrackerEntryEntity>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _repository.getEntriesByDateRange(startDate, endDate);

  Future<List<CustomTrackerEntryEntity>> getByTracker(int trackerId) =>
      _repository.getEntriesForTracker(trackerId);
}
