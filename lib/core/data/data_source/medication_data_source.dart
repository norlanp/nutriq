import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/medication_dao.dart';

class MedicationDataSource {
  final MedicationDao _dao;

  MedicationDataSource(this._dao);

  Future<int> addMed(MedicationsCompanion entry) => _dao.addMed(entry);

  Future<void> deleteMed(int id) => _dao.deleteMed(id);

  Future<List<Medication>> getMedicationsByUserId(int userId) =>
      _dao.getMedicationsByUserId(userId);

  Future<int> addLog(MedicationLogsCompanion entry) => _dao.addLog(entry);

  Future<List<MedicationLog>> getLogs(DateTime date) => _dao.getLogs(date);

  Future<List<MedicationLog>> getLogsByMedicationId(
    int medicationId,
    DateTime date,
  ) =>
      _dao.getLogsByMedicationId(medicationId, date);

  Future<List<MedicationLog>> getByDate(DateTime date) => _dao.getByDate(date);
}
