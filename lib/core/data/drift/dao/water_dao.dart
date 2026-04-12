import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/water_table.dart';

part 'water_dao.g.dart';

@DriftAccessor(tables: [WaterEntries])
class WaterDao extends DatabaseAccessor<AppDatabase> with _$WaterDaoMixin {
  WaterDao(super.db);

  Future<List<WaterEntry>> getByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(waterEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<int> getDailyTotal(DateTime date) async {
    final entries = await getByDate(date);
    int total = 0;
    for (final e in entries) {
      total += e.amountMl;
    }
    return total;
  }

  Future<List<WaterEntry>> getBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(waterEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<void> insertEntry(WaterEntriesCompanion entry) async {
    await into(waterEntries).insert(entry);
  }

  Future<void> deleteEntry(WaterEntriesCompanion entry) async {
    await (delete(waterEntries)..where((t) => t.id.equals(entry.id.value)))
        .go();
  }
}
