import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/core/domain/repository/medication_repository.dart';

class GetMedicationLogUsecase {
  final MedicationRepository _medicationRepository;

  GetMedicationLogUsecase(this._medicationRepository);

  Future<List<MedicationLogEntity>> getMedicationLogs(DateTime date) =>
      _medicationRepository.getMedicationLogs(date);
}
