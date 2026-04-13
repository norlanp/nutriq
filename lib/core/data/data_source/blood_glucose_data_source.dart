import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/blood_glucose_dao.dart';

class BloodGlucoseDataSource {
  final BloodGlucoseDao _dao;

  BloodGlucoseDataSource(this._dao);

  Future<int> addEntry(BloodGlucoseEntriesCompanion entry) =>
      _dao.addEntry(entry);

  Future<void> deleteEntry(BloodGlucoseEntriesCompanion entry) =>
      _dao.deleteEntry(entry);

  Future<List<BloodGlucoseEntry>> getByDate(DateTime date) =>
      _dao.getByDate(date);

  Future<List<BloodGlucoseEntry>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getByDateRange(startDate, endDate);

  Future<double> getAverage(DateTime startDate, DateTime endDate) =>
      _dao.getAverage(startDate, endDate);
}
