import 'package:nutriq/core/data/data_source/body_measurement_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart'
    as domain;

class BodyMeasurementRepository implements domain.BodyMeasurementRepository {
  final BodyMeasurementDataSource _dataSource;

  BodyMeasurementRepository(this._dataSource);

  @override
  Future<BodyMeasurementEntity?> getById(int id) async {
    final entry = await _dataSource.getById(id);
    return mapBodyMeasurementToEntity(entry);
  }

  @override
  Future<List<BodyMeasurementEntity>> getByDate(DateTime date) async {
    final entries = await _dataSource.getByDate(date);
    return entries.map(mapBodyMeasurementToEntity).toList();
  }

  @override
  Future<List<BodyMeasurementEntity>> getBetweenDates(
      DateTime startDate, DateTime endDate) async {
    final entries = await _dataSource.getBetweenDates(startDate, endDate);
    return entries.map(mapBodyMeasurementToEntity).toList();
  }

  @override
  Future<BodyMeasurementEntity?> getLatest(int userId) async {
    final entry = await _dataSource.getLatest(userId);
    return entry != null ? mapBodyMeasurementToEntity(entry) : null;
  }

  @override
  Future<void> addBodyMeasurement(BodyMeasurementEntity entity) async {
    final companion = mapBodyMeasurementEntityToCompanion(entity);
    await _dataSource.insertEntry(companion);
  }

  @override
  Future<void> deleteBodyMeasurement(BodyMeasurementEntity entity) async {
    final companion = mapBodyMeasurementEntityToCompanion(entity);
    await _dataSource.deleteEntry(companion);
  }
}
