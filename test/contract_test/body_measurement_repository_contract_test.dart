import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/body_measurement_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/body_measurement_dao.dart';
import 'package:nutriq/core/data/repository/body_measurement_repository.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';

void main() {
  late AppDatabase db;
  late BodyMeasurementRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = BodyMeasurementRepository(
      BodyMeasurementDataSource(BodyMeasurementDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('addBodyMeasurement persists and getByDate retrieves', () async {
    final entity = BodyMeasurementEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      waistCm: 85.0,
      neckCm: 38.0,
    );
    await repo.addBodyMeasurement(entity);
    final results = await repo.getByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.waistCm, 85.0);
    expect(results.first.neckCm, 38.0);
  });

  test('getByDate returns empty when no measurements', () async {
    final results = await repo.getByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });

  test('getLatest returns most recent measurement', () async {
    final entity1 = BodyMeasurementEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 1, 1),
      waistCm: 90.0,
    );
    final entity2 = BodyMeasurementEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 6, 15),
      waistCm: 85.0,
    );
    await repo.addBodyMeasurement(entity1);
    await repo.addBodyMeasurement(entity2);
    final latest = await repo.getLatest(1);
    expect(latest, isNotNull);
    expect(latest!.waistCm, 85.0);
  });

  test('getLatest returns null when no measurements', () async {
    final latest = await repo.getLatest(1);
    expect(latest, isNull);
  });

  test('getBetweenDates returns measurements in range', () async {
    final entity1 = BodyMeasurementEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 1, 15),
      waistCm: 90.0,
    );
    final entity2 = BodyMeasurementEntity(
      id: 2,
      userId: 1,
      date: DateTime(2024, 3, 15),
      waistCm: 87.0,
    );
    final entity3 = BodyMeasurementEntity(
      id: 3,
      userId: 1,
      date: DateTime(2024, 6, 15),
      waistCm: 85.0,
    );
    await repo.addBodyMeasurement(entity1);
    await repo.addBodyMeasurement(entity2);
    await repo.addBodyMeasurement(entity3);
    final results = await repo.getBetweenDates(
      DateTime(2024, 1, 1),
      DateTime(2024, 4, 30),
    );
    expect(results.length, 2);
  });

  test('deleteBodyMeasurement removes measurement', () async {
    final entity = BodyMeasurementEntity(
      id: 1,
      userId: 1,
      date: DateTime(2024, 6, 15),
      waistCm: 85.0,
    );
    await repo.addBodyMeasurement(entity);
    await repo.deleteBodyMeasurement(entity);
    final results = await repo.getByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });
}