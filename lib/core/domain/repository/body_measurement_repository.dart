import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';

abstract class BodyMeasurementRepository {
  Future<BodyMeasurementEntity?> getById(int id);
  Future<List<BodyMeasurementEntity>> getByDate(DateTime date);
  Future<List<BodyMeasurementEntity>> getBetweenDates(
      DateTime startDate, DateTime endDate);
  Future<BodyMeasurementEntity?> getLatest(int userId);
  Future<void> addBodyMeasurement(BodyMeasurementEntity entity);
  Future<void> deleteBodyMeasurement(BodyMeasurementEntity entity);
}
