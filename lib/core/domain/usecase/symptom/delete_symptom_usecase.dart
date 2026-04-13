import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/core/domain/repository/symptom_repository.dart';

class DeleteSymptomUsecase {
  final SymptomRepository _symptomRepository;

  DeleteSymptomUsecase(this._symptomRepository);

  Future<void> deleteSymptom(SymptomEntity entity) =>
      _symptomRepository.deleteSymptom(entity);
}
