import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';

DailyNoteEntity mapDailyNoteToEntity(DailyNote entry) => DailyNoteEntity(
      id: entry.id,
      userId: entry.userId,
      date: entry.date,
      note: entry.note,
    );

DailyNotesCompanion mapDailyNoteEntityToCompanion(DailyNoteEntity entity) =>
    DailyNotesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      date: Value(entity.date),
      note: Value(entity.note),
    );
