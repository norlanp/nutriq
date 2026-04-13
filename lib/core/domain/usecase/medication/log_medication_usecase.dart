import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/core/domain/repository/medication_repository.dart';

class LogMedicationUsecase {
  final MedicationRepository _medicationRepository;

  LogMedicationUsecase(this._medicationRepository);

  Future<void> logMedication(MedicationLogEntity entity) =>
      _medicationRepository.logMedication(entity);
}
