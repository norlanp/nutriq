import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/symptom_table.dart';

part 'symptom_dao.g.dart';

@DriftAccessor(tables: [SymptomEntries])
class SymptomDao extends DatabaseAccessor<AppDatabase> with _$SymptomDaoMixin {
  SymptomDao(super.db);

  Future<void> insertEntry(SymptomEntriesCompanion entry) async {
    await into(symptomEntries).insert(entry);
  }

  Future<void> deleteEntry(SymptomEntriesCompanion entry) async {
    await (delete(symptomEntries)..where((t) => t.id.equals(entry.id.value)))
        .go();
  }

  Future<List<SymptomEntry>> getByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(symptomEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<List<SymptomEntry>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(symptomEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<List<SymptomEntry>> getByType(String type) async {
    return await (select(symptomEntries)..where((t) => t.type.equals(type)))
        .get();
  }
}
