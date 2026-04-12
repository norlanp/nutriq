import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/body_measurement_dao.dart';

class BodyMeasurementDataSource {
  final BodyMeasurementDao _dao;

  BodyMeasurementDataSource(this._dao);

  Future<BodyMeasurement> getById(int id) => _dao.getById(id);
  Future<List<BodyMeasurement>> getByDate(DateTime date) =>
      _dao.getByDate(date);
  Future<List<BodyMeasurement>> getBetweenDates(
          DateTime startDate, DateTime endDate) =>
      _dao.getBetweenDates(startDate, endDate);
  Future<BodyMeasurement?> getLatest(int userId) => _dao.getLatest(userId);
  Future<void> insertEntry(BodyMeasurementsCompanion entry) =>
      _dao.insertEntry(entry);
  Future<void> deleteEntry(BodyMeasurementsCompanion entry) =>
      _dao.deleteEntry(entry);
}
