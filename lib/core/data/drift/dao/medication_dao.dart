import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/medication_table.dart';
import 'package:nutriq/core/data/drift/tables/medication_log_table.dart';

part 'medication_dao.g.dart';

@DriftAccessor(tables: [Medications, MedicationLogs])
class MedicationDao extends DatabaseAccessor<AppDatabase>
    with _$MedicationDaoMixin {
  MedicationDao(super.db);

  Future<int> addMed(MedicationsCompanion entry) =>
      into(medications).insert(entry);

  Future<void> deleteMed(int id) =>
      (delete(medications)..where((t) => t.id.equals(id))).go();

  Future<List<Medication>> getMedicationsByUserId(int userId) =>
      (select(medications)..where((t) => t.userId.equals(userId))).get();

  Future<int> addLog(MedicationLogsCompanion entry) =>
      into(medicationLogs).insert(entry);

  Future<List<MedicationLog>> getLogs(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(medicationLogs)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<List<MedicationLog>> getLogsByMedicationId(
    int medicationId,
    DateTime date,
  ) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(medicationLogs)
          ..where((t) =>
              t.medicationId.equals(medicationId) &
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }

  Future<List<MedicationLog>> getByDate(DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(medicationLogs)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerOrEqualValue(end)))
        .get();
  }
}
