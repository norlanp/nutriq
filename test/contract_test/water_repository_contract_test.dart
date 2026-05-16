import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/water_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/water_dao.dart';
import 'package:nutriq/core/data/repository/water_repository.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';

void main() {
  late AppDatabase db;
  late WaterRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = WaterRepository(WaterDataSource(WaterDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('getWaterByDate returns empty list initially', () async {
    final results = await repo.getWaterByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });

  test('addWater persists and retrieves water entry', () async {
    final entity = WaterEntity(
      id: 1,
      userId: 1,
      amountMl: 500,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 10, 0),
    );
    await repo.addWater(entity);
    final results = await repo.getWaterByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.amountMl, 500);
  });

  test('getDailyWaterTotal sums water for a date', () async {
    final entity1 = WaterEntity(
      id: 1,
      userId: 1,
      amountMl: 500,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 10, 0),
    );
    final entity2 = WaterEntity(
      id: 2,
      userId: 1,
      amountMl: 300,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 14, 0),
    );
    await repo.addWater(entity1);
    await repo.addWater(entity2);
    final total = await repo.getDailyWaterTotal(DateTime(2024, 6, 15));
    expect(total, 800);
  });

  test('getDailyWaterTotal returns zero when no entries', () async {
    final total = await repo.getDailyWaterTotal(DateTime(2024, 6, 15));
    expect(total, 0);
  });

  test('deleteWater removes water entry', () async {
    final entity = WaterEntity(
      id: 1,
      userId: 1,
      amountMl: 500,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 10, 0),
    );
    await repo.addWater(entity);
    await repo.deleteWater(entity);
    final results = await repo.getWaterByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });
}