import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/daily_note_dao.dart';

class DailyNoteDataSource {
  final DailyNoteDao _dao;

  DailyNoteDataSource(this._dao);

  Future<DailyNote?> getNote(int userId, DateTime date) =>
      _dao.getNote(userId, date);

  Future<void> upsertNote(DailyNotesCompanion companion) =>
      _dao.upsertNote(companion);

  Future<void> deleteNote(int id) => _dao.deleteNote(id);

  Future<List<DailyNote>> getNotesBetweenDates(
    int userId,
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getNotesBetweenDates(userId, startDate, endDate);
}
