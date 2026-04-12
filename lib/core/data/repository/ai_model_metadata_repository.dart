import 'package:nutriq/core/data/data_source/ai_model_metadata_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/ai_model_metadata_entity.dart';
import 'package:nutriq/core/domain/repository/ai_model_metadata_repository.dart'
    as domain;

class AiModelMetadataRepository implements domain.AiModelMetadataRepository {
  final AiModelMetadataDataSource _dataSource;

  AiModelMetadataRepository(this._dataSource);

  @override
  Future<List<AiModelMetadataEntity>> getAll() async {
    final entries = await _dataSource.getAll();
    return entries.map(mapAiModelMetadataToEntity).toList();
  }

  @override
  Future<AiModelMetadataEntity?> getByModelVersion(String version) async {
    final entry = await _dataSource.getByModelVersion(version);
    if (entry == null) return null;
    return mapAiModelMetadataToEntity(entry);
  }

  @override
  Future<void> addMetadata(AiModelMetadataEntity entity) async {
    final companion = mapAiModelMetadataEntityToCompanion(entity);
    await _dataSource.insertEntry(companion);
  }

  @override
  Future<void> updateMetadata(AiModelMetadataEntity entity) async {
    final companion = mapAiModelMetadataEntityToCompanion(entity);
    await _dataSource.updateEntry(companion);
  }
}
