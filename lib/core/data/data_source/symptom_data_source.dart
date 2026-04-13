import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/symptom_dao.dart';

class SymptomDataSource {
  final SymptomDao _dao;

  SymptomDataSource(this._dao);

  Future<void> insertEntry(SymptomEntriesCompanion entry) =>
      _dao.insertEntry(entry);

  Future<void> deleteEntry(SymptomEntriesCompanion entry) =>
      _dao.deleteEntry(entry);

  Future<List<SymptomEntry>> getByDate(DateTime date) => _dao.getByDate(date);

  Future<List<SymptomEntry>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getByDateRange(startDate, endDate);

  Future<List<SymptomEntry>> getByType(String type) => _dao.getByType(type);
}
