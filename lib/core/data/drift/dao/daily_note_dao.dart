import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/daily_note_table.dart';

part 'daily_note_dao.g.dart';

@DriftAccessor(tables: [DailyNotes])
class DailyNoteDao extends DatabaseAccessor<AppDatabase>
    with _$DailyNoteDaoMixin {
  DailyNoteDao(super.db);

  Future<DailyNote?> getNote(int userId, DateTime date) async {
    final start = DateTime(date.year, date.month, date.day);
    final end = start.add(const Duration(days: 1));
    return await (select(dailyNotes)
          ..where((t) =>
              t.userId.equals(userId) &
              t.date.isBiggerOrEqualValue(start) &
              t.date.isSmallerThanValue(end)))
        .getSingleOrNull();
  }

  Future<void> upsertNote(DailyNotesCompanion companion) async {
    await into(dailyNotes).insertOnConflictUpdate(companion);
  }

  Future<void> deleteNote(int id) async {
    await (delete(dailyNotes)..where((t) => t.id.equals(id))).go();
  }

  Future<List<DailyNote>> getNotesBetweenDates(
    int userId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(dailyNotes)
          ..where((t) =>
              t.userId.equals(userId) &
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }
}
