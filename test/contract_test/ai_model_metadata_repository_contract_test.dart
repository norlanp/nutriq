import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/ai_model_metadata_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/ai_model_metadata_dao.dart';
import 'package:nutriq/core/data/repository/ai_model_metadata_repository.dart';
import 'package:nutriq/core/domain/entity/ai_model_metadata_entity.dart';

void main() {
  late AppDatabase db;
  late AiModelMetadataRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = AiModelMetadataRepository(
      AiModelMetadataDataSource(AiModelMetadataDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('getAll returns empty initially', () async {
    final results = await repo.getAll();
    expect(results, isEmpty);
  });

  test('addMetadata persists and getAll retrieves', () async {
    final entity = AiModelMetadataEntity(
      id: 1,
      modelVersion: 'v1.0.0',
      assetPath: '/models/v1.0.0.tflite',
      lastUpdated: DateTime(2024, 6, 15),
    );
    await repo.addMetadata(entity);
    final results = await repo.getAll();
    expect(results.length, 1);
    expect(results.first.modelVersion, 'v1.0.0');
  });

  test('getByModelVersion returns matching metadata', () async {
    final entity = AiModelMetadataEntity(
      id: 1,
      modelVersion: 'v1.0.0',
      assetPath: '/models/v1.0.0.tflite',
      lastUpdated: DateTime(2024, 6, 15),
    );
    await repo.addMetadata(entity);
    final result = await repo.getByModelVersion('v1.0.0');
    expect(result, isNotNull);
    expect(result!.modelVersion, 'v1.0.0');
  });

  test('getByModelVersion returns null for nonexistent version', () async {
    final result = await repo.getByModelVersion('v999.0.0');
    expect(result, isNull);
  });

  test('updateMetadata updates existing entry', () async {
    final entity = AiModelMetadataEntity(
      id: 1,
      modelVersion: 'v1.0.0',
      assetPath: '/models/v1.0.0.tflite',
      lastUpdated: DateTime(2024, 6, 15),
    );
    await repo.addMetadata(entity);
    final updated = AiModelMetadataEntity(
      id: 1,
      modelVersion: 'v1.0.0',
      assetPath: '/models/v1.0.0-updated.tflite',
      lastUpdated: DateTime(2024, 6, 20),
    );
    await repo.updateMetadata(updated);
    final result = await repo.getByModelVersion('v1.0.0');
    expect(result, isNotNull);
    expect(result!.assetPath, '/models/v1.0.0-updated.tflite');
  });
}