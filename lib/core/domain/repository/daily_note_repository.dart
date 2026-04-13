import 'package:nutriq/core/domain/entity/daily_note_entity.dart';

abstract class DailyNoteRepository {
  Future<DailyNoteEntity?> getDailyNote(int userId, DateTime date);

  Future<void> saveDailyNote(DailyNoteEntity entity);

  Future<void> deleteDailyNote(int id);

  Future<List<DailyNoteEntity>> getDailyNotesBetweenDates(
    int userId,
    DateTime startDate,
    DateTime endDate,
  );
}
