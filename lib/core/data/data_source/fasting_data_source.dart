import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/fasting_dao.dart';

class FastingDataSource {
  final FastingDao _dao;

  FastingDataSource(this._dao);

  Future<int> addFast(FastsCompanion entry) => _dao.addFast(entry);

  Future<void> endFast(int id, DateTime endTime) => _dao.endFast(id, endTime);

  Future<Fast?> getActiveFast() => _dao.getActiveFast();

  Future<List<Fast>> getHistory(DateTime startDate, DateTime endDate) =>
      _dao.getHistory(startDate, endDate);

  Future<List<Fast>> getFastsBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getFastsBetweenDates(startDate, endDate);
}
