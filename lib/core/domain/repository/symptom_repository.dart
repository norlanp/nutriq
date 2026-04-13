import 'package:nutriq/core/domain/entity/symptom_entity.dart';

abstract class SymptomRepository {
  Future<List<SymptomEntity>> getSymptomsByDate(DateTime date);

  Future<List<SymptomEntity>> getSymptomsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  Future<List<SymptomEntity>> getSymptomsByType(String type);

  Future<void> addSymptom(SymptomEntity entity);

  Future<void> deleteSymptom(SymptomEntity entity);
}
