import 'package:nutriq/core/data/data_source/blood_glucose_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart'
    as domain;

class BloodGlucoseRepository implements domain.BloodGlucoseRepository {
  final BloodGlucoseDataSource _bloodGlucoseDataSource;

  BloodGlucoseRepository(this._bloodGlucoseDataSource);

  @override
  Future<void> addBloodGlucose(BloodGlucoseEntity entity) async {
    final companion = mapBloodGlucoseEntityToCompanion(entity);
    await _bloodGlucoseDataSource.addEntry(companion);
  }

  @override
  Future<void> deleteBloodGlucose(BloodGlucoseEntity entity) async {
    final companion = mapBloodGlucoseEntityToCompanion(entity);
    await _bloodGlucoseDataSource.deleteEntry(companion);
  }

  @override
  Future<List<BloodGlucoseEntity>> getBloodGlucoseByDate(DateTime date) async {
    final entries = await _bloodGlucoseDataSource.getByDate(date);
    return entries.map(mapBloodGlucoseToEntity).toList();
  }

  @override
  Future<List<BloodGlucoseEntity>> getBloodGlucoseBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries =
        await _bloodGlucoseDataSource.getByDateRange(startDate, endDate);
    return entries.map(mapBloodGlucoseToEntity).toList();
  }

  @override
  Future<double> getBloodGlucoseAverage(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _bloodGlucoseDataSource.getAverage(startDate, endDate);
}
