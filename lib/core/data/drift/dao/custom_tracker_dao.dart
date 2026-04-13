import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/custom_tracker_table.dart';
import 'package:nutriq/core/data/drift/tables/custom_tracker_entry_table.dart';

part 'custom_tracker_dao.g.dart';

@DriftAccessor(tables: [CustomTrackers, CustomTrackerEntries])
class CustomTrackerDao extends DatabaseAccessor<AppDatabase>
    with _$CustomTrackerDaoMixin {
  CustomTrackerDao(super.db);

  Future<int> addTracker(CustomTrackersCompanion entry) =>
      into(customTrackers).insert(entry);

  Future<void> deleteTracker(int id) =>
      (delete(customTrackers)..where((t) => t.id.equals(id))).go();

  Future<List<CustomTracker>> getTrackersForUser(int userId) =>
      (select(customTrackers)..where((t) => t.userId.equals(userId))).get();

  Future<int> addEntry(CustomTrackerEntriesCompanion entry) =>
      into(customTrackerEntries).insert(entry);

  Future<void> deleteEntry(int id) =>
      (delete(customTrackerEntries)..where((t) => t.id.equals(id))).go();

  Future<List<CustomTrackerEntry>> getEntriesByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(customTrackerEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<List<CustomTrackerEntry>> getEntriesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(customTrackerEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<List<CustomTrackerEntry>> getEntriesForTracker(int trackerId) =>
      (select(customTrackerEntries)
            ..where((t) => t.trackerId.equals(trackerId)))
          .get();
}
