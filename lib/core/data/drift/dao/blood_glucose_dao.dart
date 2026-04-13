import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/blood_glucose_table.dart';

part 'blood_glucose_dao.g.dart';

@DriftAccessor(tables: [BloodGlucoseEntries])
class BloodGlucoseDao extends DatabaseAccessor<AppDatabase>
    with _$BloodGlucoseDaoMixin {
  BloodGlucoseDao(super.db);

  Future<int> addEntry(BloodGlucoseEntriesCompanion entry) =>
      into(bloodGlucoseEntries).insert(entry);

  Future<void> deleteEntry(BloodGlucoseEntriesCompanion entry) =>
      (delete(bloodGlucoseEntries)..where((t) => t.id.equals(entry.id.value)))
          .go();

  Future<List<BloodGlucoseEntry>> getByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(bloodGlucoseEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<List<BloodGlucoseEntry>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(bloodGlucoseEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<double> getAverage(DateTime startDate, DateTime endDate) async {
    final entries = await getByDateRange(startDate, endDate);
    if (entries.isEmpty) return 0.0;
    final total = entries.fold<int>(0, (sum, e) => sum + e.valueMgDl);
    return total / entries.length;
  }
}
