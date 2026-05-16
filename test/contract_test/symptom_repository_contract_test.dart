import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/symptom_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/symptom_dao.dart';
import 'package:nutriq/core/data/repository/symptom_repository.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';

void main() {
  late AppDatabase db;
  late SymptomRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = SymptomRepository(SymptomDataSource(SymptomDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('addSymptom persists and getSymptomsByDate retrieves', () async {
    final entity = SymptomEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 10, 0),
      type: 'headache',
      severity: 5,
    );
    await repo.addSymptom(entity);
    final results = await repo.getSymptomsByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.type, 'headache');
    expect(results.first.severity, 5);
  });

  test('getSymptomsByDate returns empty when no symptoms', () async {
    final results = await repo.getSymptomsByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });

  test('getSymptomsByType returns matching symptoms', () async {
    final entity1 = SymptomEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 10, 0),
      type: 'headache',
      severity: 5,
    );
    final entity2 = SymptomEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 16),
      timestamp: DateTime(2024, 6, 16, 14, 0),
      type: 'fatigue',
      severity: 3,
    );
    await repo.addSymptom(entity1);
    await repo.addSymptom(entity2);
    final results = await repo.getSymptomsByType('headache');
    expect(results.length, 1);
    expect(results.first.type, 'headache');
  });

  test('getSymptomsByDateRange returns symptoms in range', () async {
    final entity1 = SymptomEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 10),
      timestamp: DateTime(2024, 6, 10, 8, 0),
      type: 'headache',
      severity: 5,
    );
    final entity2 = SymptomEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 20),
      timestamp: DateTime(2024, 6, 20, 14, 0),
      type: 'headache',
      severity: 3,
    );
    await repo.addSymptom(entity1);
    await repo.addSymptom(entity2);
    final results = await repo.getSymptomsByDateRange(
      DateTime(2024, 6, 1),
      DateTime(2024, 6, 15),
    );
    expect(results.length, 1);
    expect(results.first.id, 1);
  });

  test('deleteSymptom removes symptom', () async {
    final entity = SymptomEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 10, 0),
      type: 'headache',
      severity: 5,
    );
    await repo.addSymptom(entity);
    await repo.deleteSymptom(entity);
    final results = await repo.getSymptomsByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });
}