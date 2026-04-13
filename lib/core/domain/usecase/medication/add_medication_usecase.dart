import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/repository/medication_repository.dart';

class AddMedicationUsecase {
  final MedicationRepository _medicationRepository;

  AddMedicationUsecase(this._medicationRepository);

  Future<void> addMedication(MedicationEntity entity) =>
      _medicationRepository.addMedication(entity);
}
