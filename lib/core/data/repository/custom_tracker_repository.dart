import 'package:nutriq/core/data/data_source/custom_tracker_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart'
    as domain;

class CustomTrackerRepository implements domain.CustomTrackerRepository {
  final CustomTrackerDataSource _dataSource;

  CustomTrackerRepository(this._dataSource);

  @override
  Future<List<CustomTrackerEntity>> getTrackersForUser(int userId) async {
    final trackers = await _dataSource.getTrackersForUser(userId);
    return trackers.map(mapCustomTrackerToEntity).toList();
  }

  @override
  Future<void> createTracker(CustomTrackerEntity entity) async {
    final companion = mapCustomTrackerEntityToCompanion(entity);
    await _dataSource.addTracker(companion);
  }

  @override
  Future<void> deleteTracker(int id) async {
    await _dataSource.deleteTracker(id);
  }

  @override
  Future<void> logEntry(CustomTrackerEntryEntity entity) async {
    final companion = mapCustomTrackerEntryEntityToCompanion(entity);
    await _dataSource.addEntry(companion);
  }

  @override
  Future<void> deleteEntry(int id) async {
    await _dataSource.deleteEntry(id);
  }

  @override
  Future<List<CustomTrackerEntryEntity>> getEntriesByDate(DateTime date) async {
    final entries = await _dataSource.getEntriesByDate(date);
    return entries.map(mapCustomTrackerEntryToEntity).toList();
  }

  @override
  Future<List<CustomTrackerEntryEntity>> getEntriesByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries = await _dataSource.getEntriesByDateRange(startDate, endDate);
    return entries.map(mapCustomTrackerEntryToEntity).toList();
  }

  @override
  Future<List<CustomTrackerEntryEntity>> getEntriesForTracker(
      int trackerId) async {
    final entries = await _dataSource.getEntriesForTracker(trackerId);
    return entries.map(mapCustomTrackerEntryToEntity).toList();
  }
}
