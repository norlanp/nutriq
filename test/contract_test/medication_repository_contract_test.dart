import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/medication_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/medication_dao.dart';
import 'package:nutriq/core/data/repository/medication_repository.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';

void main() {
  late AppDatabase db;
  late MedicationRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = MedicationRepository(MedicationDataSource(MedicationDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('addMedication persists and getMedicationsByUserId retrieves', () async {
    final entity = MedicationEntity(
      id: 1,
      userId: 1,
      name: 'Aspirin',
      dosage: '100mg',
      frequency: MedicationFrequencyType.daily,
      timesPerDay: 1,
    );
    await repo.addMedication(entity);
    final results = await repo.getMedicationsByUserId(1);
    expect(results.length, 1);
    expect(results.first.name, 'Aspirin');
    expect(results.first.dosage, '100mg');
  });

  test('getMedicationsByUserId returns empty initially', () async {
    final results = await repo.getMedicationsByUserId(1);
    expect(results, isEmpty);
  });

  test('deleteMedication removes medication', () async {
    final entity = MedicationEntity(
      id: 1,
      userId: 1,
      name: 'Aspirin',
      dosage: '100mg',
      frequency: MedicationFrequencyType.daily,
      timesPerDay: 1,
    );
    await repo.addMedication(entity);
    await repo.deleteMedication(1);
    final results = await repo.getMedicationsByUserId(1);
    expect(results, isEmpty);
  });

  test('logMedication persists and getMedicationLogs retrieves', () async {
    final medication = MedicationEntity(
      id: 1,
      userId: 1,
      name: 'Aspirin',
      dosage: '100mg',
      frequency: MedicationFrequencyType.daily,
      timesPerDay: 1,
    );
    await repo.addMedication(medication);
    final log = MedicationLogEntity(
      id: 1,
      userId: 1,
      medicationId: 1,
      date: DateTime(2024, 6, 15),
      timestamp: DateTime(2024, 6, 15, 8, 0),
      doseTaken: true,
    );
    await repo.logMedication(log);
    final results = await repo.getMedicationLogs(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.doseTaken, true);
    expect(results.first.medicationId, 1);
  });
}