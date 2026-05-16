import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';

abstract class CustomTrackerRepository {
  Future<List<CustomTrackerEntity>> getTrackersForUser(int userId);

  Future<void> createTracker(CustomTrackerEntity entity);

  Future<void> deleteTracker(int id);

  Future<void> logEntry(CustomTrackerEntryEntity entity);

  Future<void> deleteEntry(int id);

  Future<List<CustomTrackerEntryEntity>> getEntriesByDate(DateTime date);

  Future<List<CustomTrackerEntryEntity>> getEntriesByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<CustomTrackerEntryEntity>> getEntriesForTracker(int trackerId);
}
