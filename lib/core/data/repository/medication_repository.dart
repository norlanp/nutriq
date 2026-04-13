import 'package:nutriq/core/data/data_source/medication_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/core/domain/repository/medication_repository.dart'
    as domain;

class MedicationRepository implements domain.MedicationRepository {
  final MedicationDataSource _medicationDataSource;

  MedicationRepository(this._medicationDataSource);

  @override
  Future<void> addMedication(MedicationEntity entity) async {
    final companion = mapMedicationEntityToCompanion(entity);
    await _medicationDataSource.addMed(companion);
  }

  @override
  Future<void> deleteMedication(int id) async {
    await _medicationDataSource.deleteMed(id);
  }

  @override
  Future<List<MedicationEntity>> getMedicationsByUserId(int userId) async {
    final medications =
        await _medicationDataSource.getMedicationsByUserId(userId);
    return medications.map(mapMedicationToEntity).toList();
  }

  @override
  Future<void> logMedication(MedicationLogEntity entity) async {
    final companion = mapMedicationLogEntityToCompanion(entity);
    await _medicationDataSource.addLog(companion);
  }

  @override
  Future<List<MedicationLogEntity>> getMedicationLogs(DateTime date) async {
    final logs = await _medicationDataSource.getLogs(date);
    return logs.map(mapMedicationLogToEntity).toList();
  }

  @override
  Future<List<MedicationLogEntity>> getMedicationLogsByMedicationId(
    int medicationId,
    DateTime date,
  ) async {
    final logs = await _medicationDataSource.getLogsByMedicationId(
      medicationId,
      date,
    );
    return logs.map(mapMedicationLogToEntity).toList();
  }
}
