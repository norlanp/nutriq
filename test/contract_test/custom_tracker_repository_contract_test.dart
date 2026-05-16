import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/custom_tracker_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/custom_tracker_dao.dart';
import 'package:nutriq/core/data/repository/custom_tracker_repository.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';

void main() {
  late AppDatabase db;
  late CustomTrackerRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = CustomTrackerRepository(
      CustomTrackerDataSource(CustomTrackerDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('createTracker persists and getTrackersForUser retrieves', () async {
    final entity = CustomTrackerEntity(
      id: 1,
      userId: 1,
      name: 'Mood',
      type: TrackerType.scale,
      min: 1,
      max: 10,
      icon: '😊',
    );
    await repo.createTracker(entity);
    final results = await repo.getTrackersForUser(1);
    expect(results.length, 1);
    expect(results.first.name, 'Mood');
    expect(results.first.type, TrackerType.scale);
  });

  test('getTrackersForUser returns empty initially', () async {
    final results = await repo.getTrackersForUser(1);
    expect(results, isEmpty);
  });

  test('deleteTracker removes tracker', () async {
    final entity = CustomTrackerEntity(
      id: 1,
      userId: 1,
      name: 'Mood',
      type: TrackerType.scale,
      min: 1,
      max: 10,
      icon: '😊',
    );
    await repo.createTracker(entity);
    await repo.deleteTracker(1);
    final results = await repo.getTrackersForUser(1);
    expect(results, isEmpty);
  });

  test('logEntry persists and getEntriesByDate retrieves', () async {
    final tracker = CustomTrackerEntity(
      id: 1,
      userId: 1,
      name: 'Mood',
      type: TrackerType.scale,
      min: 1,
      max: 10,
      icon: '😊',
    );
    await repo.createTracker(tracker);
    final entry = CustomTrackerEntryEntity(
      id: 1,
      userId: 1,
      trackerId: 1,
      date: DateTime(2024, 6, 15),
      value: 7.0,
    );
    await repo.logEntry(entry);
    final results = await repo.getEntriesByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.value, 7.0);
  });

  test('getEntriesForTracker returns entries for specific tracker', () async {
    final tracker = CustomTrackerEntity(
      id: 1,
      userId: 1,
      name: 'Mood',
      type: TrackerType.scale,
      min: 1,
      max: 10,
      icon: '😊',
    );
    await repo.createTracker(tracker);
    final entry = CustomTrackerEntryEntity(
      id: 1,
      userId: 1,
      trackerId: 1,
      date: DateTime(2024, 6, 15),
      value: 7.0,
    );
    await repo.logEntry(entry);
    final results = await repo.getEntriesForTracker(1);
    expect(results.length, 1);
    expect(results.first.trackerId, 1);
  });

  test('deleteEntry removes entry', () async {
    final tracker = CustomTrackerEntity(
      id: 1,
      userId: 1,
      name: 'Mood',
      type: TrackerType.scale,
      min: 1,
      max: 10,
      icon: '😊',
    );
    await repo.createTracker(tracker);
    final entry = CustomTrackerEntryEntity(
      id: 1,
      userId: 1,
      trackerId: 1,
      date: DateTime(2024, 6, 15),
      value: 7.0,
    );
    await repo.logEntry(entry);
    await repo.deleteEntry(1);
    final results = await repo.getEntriesByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });
}