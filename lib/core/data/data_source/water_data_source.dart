import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/water_dao.dart';

class WaterDataSource {
  final WaterDao _dao;

  WaterDataSource(this._dao);

  Future<List<WaterEntry>> getByDate(DateTime date) => _dao.getByDate(date);

  Future<int> getDailyTotal(DateTime date) => _dao.getDailyTotal(date);

  Future<List<WaterEntry>> getBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getBetweenDates(startDate, endDate);

  Future<void> insertEntry(WaterEntriesCompanion entry) =>
      _dao.insertEntry(entry);

  Future<void> deleteEntry(WaterEntriesCompanion entry) =>
      _dao.deleteEntry(entry);
}
