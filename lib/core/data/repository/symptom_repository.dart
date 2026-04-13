import 'package:nutriq/core/data/data_source/symptom_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/core/domain/repository/symptom_repository.dart'
    as domain;

class SymptomRepository implements domain.SymptomRepository {
  final SymptomDataSource _symptomDataSource;

  SymptomRepository(this._symptomDataSource);

  @override
  Future<List<SymptomEntity>> getSymptomsByDate(DateTime date) async {
    final entries = await _symptomDataSource.getByDate(date);
    return entries.map(mapSymptomToEntity).toList();
  }

  @override
  Future<List<SymptomEntity>> getSymptomsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries = await _symptomDataSource.getByDateRange(startDate, endDate);
    return entries.map(mapSymptomToEntity).toList();
  }

  @override
  Future<List<SymptomEntity>> getSymptomsByType(String type) async {
    final entries = await _symptomDataSource.getByType(type);
    return entries.map(mapSymptomToEntity).toList();
  }

  @override
  Future<void> addSymptom(SymptomEntity entity) async {
    final companion = mapSymptomEntityToCompanion(entity);
    await _symptomDataSource.insertEntry(companion);
  }

  @override
  Future<void> deleteSymptom(SymptomEntity entity) async {
    final companion = mapSymptomEntityToCompanion(entity);
    await _symptomDataSource.deleteEntry(companion);
  }
}
