import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/body_measurement_table.dart';

part 'body_measurement_dao.g.dart';

@DriftAccessor(tables: [BodyMeasurements])
class BodyMeasurementDao extends DatabaseAccessor<AppDatabase>
    with _$BodyMeasurementDaoMixin {
  BodyMeasurementDao(super.db);

  Future<BodyMeasurement> getById(int id) async {
    return await (select(bodyMeasurements)..where((t) => t.id.equals(id)))
        .getSingle();
  }

  Future<List<BodyMeasurement>> getByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(bodyMeasurements)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<List<BodyMeasurement>> getBetweenDates(
      DateTime startDate, DateTime endDate) async {
    return await (select(bodyMeasurements)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<BodyMeasurement?> getLatest(int userId) async {
    return await (select(bodyMeasurements)
          ..where((t) => t.userId.equals(userId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> insertEntry(BodyMeasurementsCompanion entry) async {
    await into(bodyMeasurements).insert(entry);
  }

  Future<void> deleteEntry(BodyMeasurementsCompanion entry) async {
    await (delete(bodyMeasurements)..where((t) => t.id.equals(entry.id.value)))
        .go();
  }
}
