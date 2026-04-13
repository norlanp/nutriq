import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';

abstract class MedicationRepository {
  Future<void> addMedication(MedicationEntity entity);
  Future<void> deleteMedication(int id);
  Future<List<MedicationEntity>> getMedicationsByUserId(int userId);
  Future<void> logMedication(MedicationLogEntity entity);
  Future<List<MedicationLogEntity>> getMedicationLogs(DateTime date);
  Future<List<MedicationLogEntity>> getMedicationLogsByMedicationId(
    int medicationId,
    DateTime date,
  );
}
