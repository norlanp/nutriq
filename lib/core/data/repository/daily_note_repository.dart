import 'package:nutriq/core/data/data_source/daily_note_data_source.dart';
import 'package:nutriq/core/data/mapper/daily_note_mapper.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';
import 'package:nutriq/core/domain/repository/daily_note_repository.dart'
    as domain;

class DailyNoteRepository implements domain.DailyNoteRepository {
  final DailyNoteDataSource _dailyNoteDataSource;

  DailyNoteRepository(this._dailyNoteDataSource);

  @override
  Future<DailyNoteEntity?> getDailyNote(int userId, DateTime date) async {
    final entry = await _dailyNoteDataSource.getNote(userId, date);
    if (entry == null) return null;
    return mapDailyNoteToEntity(entry);
  }

  @override
  Future<void> saveDailyNote(DailyNoteEntity entity) async {
    final companion = mapDailyNoteEntityToCompanion(entity);
    await _dailyNoteDataSource.upsertNote(companion);
  }

  @override
  Future<void> deleteDailyNote(int id) async {
    await _dailyNoteDataSource.deleteNote(id);
  }

  @override
  Future<List<DailyNoteEntity>> getDailyNotesBetweenDates(
    int userId,
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries = await _dailyNoteDataSource.getNotesBetweenDates(
        userId, startDate, endDate);
    return entries.map(mapDailyNoteToEntity).toList();
  }
}
