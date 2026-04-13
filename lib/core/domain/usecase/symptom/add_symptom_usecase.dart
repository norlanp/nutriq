import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/core/domain/repository/symptom_repository.dart';

class AddSymptomUsecase {
  final SymptomRepository _symptomRepository;

  AddSymptomUsecase(this._symptomRepository);

  Future<void> addSymptom(SymptomEntity entity) =>
      _symptomRepository.addSymptom(entity);
}
