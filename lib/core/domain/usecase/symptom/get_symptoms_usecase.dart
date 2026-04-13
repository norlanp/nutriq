import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/core/domain/repository/symptom_repository.dart';

class GetSymptomsUsecase {
  final SymptomRepository _symptomRepository;

  GetSymptomsUsecase(this._symptomRepository);

  Future<List<SymptomEntity>> getSymptomsByDate(DateTime date) =>
      _symptomRepository.getSymptomsByDate(date);

  Future<List<SymptomEntity>> getSymptomsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _symptomRepository.getSymptomsByDateRange(startDate, endDate);

  Future<List<SymptomEntity>> getSymptomsByType(String type) =>
      _symptomRepository.getSymptomsByType(type);
}
