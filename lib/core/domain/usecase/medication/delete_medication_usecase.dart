import 'package:nutriq/core/domain/repository/medication_repository.dart';

class DeleteMedicationUsecase {
  final MedicationRepository _medicationRepository;

  DeleteMedicationUsecase(this._medicationRepository);

  Future<void> deleteMedication(int id) =>
      _medicationRepository.deleteMedication(id);
}
