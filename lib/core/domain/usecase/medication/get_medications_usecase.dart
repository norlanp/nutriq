import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/repository/medication_repository.dart';

class GetMedicationsUsecase {
  final MedicationRepository _medicationRepository;

  GetMedicationsUsecase(this._medicationRepository);

  Future<List<MedicationEntity>> getMedicationsByUserId(int userId) =>
      _medicationRepository.getMedicationsByUserId(userId);
}
