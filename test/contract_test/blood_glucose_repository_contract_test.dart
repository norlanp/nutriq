import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/blood_glucose_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/blood_glucose_dao.dart';
import 'package:nutriq/core/data/repository/blood_glucose_repository.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';

void main() {
  late AppDatabase db;
  late BloodGlucoseRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = BloodGlucoseRepository(
      BloodGlucoseDataSource(BloodGlucoseDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('addBloodGlucose persists and getBloodGlucoseByDate retrieves', () async {
    final entity = BloodGlucoseEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 8, 0),
      valueMgDl: 95,
      label: BloodGlucoseLabelType.fasting,
    );
    await repo.addBloodGlucose(entity);
    final results = await repo.getBloodGlucoseByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.valueMgDl, 95);
    expect(results.first.label, BloodGlucoseLabelType.fasting);
  });

  test('getBloodGlucoseByDate returns empty when no entries', () async {
    final results = await repo.getBloodGlucoseByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });

  test('getBloodGlucoseBetweenDates returns entries in range', () async {
    final entity1 = BloodGlucoseEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 10),
      timestamp: DateTime(2024, 6, 10, 8, 0),
      valueMgDl: 95,
      label: BloodGlucoseLabelType.fasting,
    );
    final entity2 = BloodGlucoseEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 20),
      timestamp: DateTime(2024, 6, 20, 8, 0),
      valueMgDl: 110,
      label: BloodGlucoseLabelType.fasting,
    );
    await repo.addBloodGlucose(entity1);
    await repo.addBloodGlucose(entity2);
    final results = await repo.getBloodGlucoseBetweenDates(
      DateTime(2024, 6, 1),
      DateTime(2024, 6, 15),
    );
    expect(results.length, 1);
    expect(results.first.valueMgDl, 95);
  });

  test('getBloodGlucoseAverage returns correct average', () async {
    final entity1 = BloodGlucoseEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 10),
      timestamp: DateTime(2024, 6, 10, 8, 0),
      valueMgDl: 90,
      label: BloodGlucoseLabelType.fasting,
    );
    final entity2 = BloodGlucoseEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 12),
      timestamp: DateTime(2024, 6, 12, 8, 0),
      valueMgDl: 110,
      label: BloodGlucoseLabelType.fasting,
    );
    await repo.addBloodGlucose(entity1);
    await repo.addBloodGlucose(entity2);
    final average = await repo.getBloodGlucoseAverage(
      DateTime(2024, 6, 1),
      DateTime(2024, 6, 30),
    );
    expect(average, 100.0);
  });

  test('deleteBloodGlucose removes entry', () async {
    final entity = BloodGlucoseEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 8, 0),
      valueMgDl: 95,
      label: BloodGlucoseLabelType.fasting,
    );
    await repo.addBloodGlucose(entity);
    await repo.deleteBloodGlucose(entity);
    final results = await repo.getBloodGlucoseByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });
}