import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/custom_tracker_dao.dart';

class CustomTrackerDataSource {
  final CustomTrackerDao _dao;

  CustomTrackerDataSource(this._dao);

  Future<int> addTracker(CustomTrackersCompanion entry) =>
      _dao.addTracker(entry);

  Future<void> deleteTracker(int id) => _dao.deleteTracker(id);

  Future<List<CustomTracker>> getTrackersForUser(int userId) =>
      _dao.getTrackersForUser(userId);

  Future<int> addEntry(CustomTrackerEntriesCompanion entry) =>
      _dao.addEntry(entry);

  Future<void> deleteEntry(int id) => _dao.deleteEntry(id);

  Future<List<CustomTrackerEntry>> getEntriesByDate(DateTime date) =>
      _dao.getEntriesByDate(date);

  Future<List<CustomTrackerEntry>> getEntriesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getEntriesByDateRange(startDate, endDate);

  Future<List<CustomTrackerEntry>> getEntriesForTracker(int trackerId) =>
      _dao.getEntriesForTracker(trackerId);
}
