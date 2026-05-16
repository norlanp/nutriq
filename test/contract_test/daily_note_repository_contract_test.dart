import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/daily_note_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/daily_note_dao.dart';
import 'package:nutriq/core/data/repository/daily_note_repository.dart';
import 'package:nutriq/core/domain/entity/daily_note_entity.dart';

void main() {
  late AppDatabase db;
  late DailyNoteRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = DailyNoteRepository(DailyNoteDataSource(DailyNoteDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('getDailyNote returns null initially', () async {
    final result = await repo.getDailyNote(1, DateTime(2024, 6, 15));
    expect(result, isNull);
  });

  test('saveDailyNote persists and getDailyNote retrieves', () async {
    final entity = DailyNoteEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      note: 'Felt great today',
    );
    await repo.saveDailyNote(entity);
    final result = await repo.getDailyNote(1, DateTime(2024, 6, 15));
    expect(result, isNotNull);
    expect(result!.note, 'Felt great today');
  });

  test('deleteDailyNote removes note', () async {
    final entity = DailyNoteEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      note: 'Felt great today',
    );
    await repo.saveDailyNote(entity);
    await repo.deleteDailyNote(1);
    final result = await repo.getDailyNote(1, DateTime(2024, 6, 15));
    expect(result, isNull);
  });

  test('getDailyNotesBetweenDates returns notes in range', () async {
    final entity1 = DailyNoteEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 10),
      note: 'Note 1',
    );
    final entity2 = DailyNoteEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 15),
      note: 'Note 2',
    );
    await repo.saveDailyNote(entity1);
    await repo.saveDailyNote(entity2);
    final results = await repo.getDailyNotesBetweenDates(
      1,
      DateTime(2024, 6, 1),
      DateTime(2024, 6, 12),
    );
    expect(results.length, 1);
    expect(results.first.note, 'Note 1');
  });
}