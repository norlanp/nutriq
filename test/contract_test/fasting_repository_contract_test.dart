import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/fasting_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/fasting_dao.dart';
import 'package:nutriq/core/data/repository/fasting_repository.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';

void main() {
  late AppDatabase db;
  late FastingRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = FastingRepository(FastingDataSource(FastingDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('startFast persists and getActiveFast returns it', () async {
    final entity = FastingEntity(
      id: 1,
      userId: 1,
      startTime: DateTime(2024, 6, 1, 8, 0),
      targetDurationMinutes: 960,
      presetType: FastingPresetType.sixteenEight,
    );
    await repo.startFast(entity);
    final active = await repo.getActiveFast();
    expect(active, isNotNull);
    expect(active!.id, 1);
    expect(active.presetType, FastingPresetType.sixteenEight);
  });

  test('getActiveFast returns null when no active fast', () async {
    final active = await repo.getActiveFast();
    expect(active, isNull);
  });

  test('endFast makes getActiveFast return null', () async {
    final entity = FastingEntity(
      id: 1,
      userId: 1,
      startTime: DateTime(2024, 6, 1, 8, 0),
      targetDurationMinutes: 960,
      presetType: FastingPresetType.sixteenEight,
    );
    await repo.startFast(entity);
    await repo.endFast(1, DateTime(2024, 6, 1, 22, 0));
    final active = await repo.getActiveFast();
    expect(active, isNull);
  });

  test('getFastingHistory returns completed fasts', () async {
    final entity = FastingEntity(
      id: 1,
      userId: 1,
      startTime: DateTime(2024, 6, 1, 8, 0),
      targetDurationMinutes: 960,
      presetType: FastingPresetType.sixteenEight,
    );
    await repo.startFast(entity);
    await repo.endFast(1, DateTime(2024, 6, 1, 22, 0));
    final history = await repo.getFastingHistory(
      DateTime(2024, 6, 1),
      DateTime(2024, 6, 30),
    );
    expect(history.length, 1);
  });

  test('getCurrentStreak returns zero with no completed fasts', () async {
    final streak = await repo.getCurrentStreak();
    expect(streak, 0);
  });
}