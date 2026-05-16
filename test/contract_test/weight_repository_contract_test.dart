import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/weight_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/weight_dao.dart';
import 'package:nutriq/core/data/repository/weight_repository.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

void main() {
  late AppDatabase db;
  late WeightRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = WeightRepository(WeightDataSource(WeightDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('getWeights returns empty list initially', () async {
    final results = await repo.getWeights();
    expect(results, isEmpty);
  });

  test('addWeight persists and retrieves weight', () async {
    final entity = WeightEntity(
      id: 1,
      userId: 1,
      weightKg: 80.0,
      date: DateTime(2024, 1, 1),
    );
    await repo.addWeight(entity);
    final results = await repo.getWeights();
    expect(results.length, 1);
    expect(results.first.weightKg, 80.0);
  });

  test('getLatestWeight returns most recent weight', () async {
    final entity1 = WeightEntity(
      id: 1,
      userId: 1,
      weightKg: 80.0,
      date: DateTime(2024, 1, 1),
    );
    final entity2 = WeightEntity(
      id: 2,
      userId: 1,
      weightKg: 78.5,
      date: DateTime(2024, 2, 1),
    );
    await repo.addWeight(entity1);
    await repo.addWeight(entity2);
    final latest = await repo.getLatestWeight();
    expect(latest, isNotNull);
    expect(latest!.weightKg, 78.5);
  });

  test('getLatestWeight returns null when no weights', () async {
    final latest = await repo.getLatestWeight();
    expect(latest, isNull);
  });

  test('getWeightsBetweenDates returns weights in range', () async {
    final entity1 = WeightEntity(
      id: 1,
      userId: 1,
      weightKg: 80.0,
      date: DateTime(2024, 1, 1),
    );
    final entity2 = WeightEntity(
      id: 2,
      userId: 1,
      weightKg: 78.5,
      date: DateTime(2024, 3, 1),
    );
    final entity3 = WeightEntity(
      id: 3,
      userId: 1,
      weightKg: 77.0,
      date: DateTime(2024, 5, 1),
    );
    await repo.addWeight(entity1);
    await repo.addWeight(entity2);
    await repo.addWeight(entity3);
    final results = await repo.getWeightsBetweenDates(
      DateTime(2024, 1, 1),
      DateTime(2024, 3, 31),
    );
    expect(results.length, 2);
  });

  test('deleteWeight removes weight', () async {
    final entity = WeightEntity(
      id: 1,
      userId: 1,
      weightKg: 80.0,
      date: DateTime(2024, 1, 1),
    );
    await repo.addWeight(entity);
    await repo.deleteWeight(entity);
    final results = await repo.getWeights();
    expect(results, isEmpty);
  });
}