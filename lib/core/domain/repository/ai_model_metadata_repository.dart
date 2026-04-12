import 'package:nutriq/core/domain/entity/ai_model_metadata_entity.dart';

abstract class AiModelMetadataRepository {
  Future<List<AiModelMetadataEntity>> getAll();

  Future<AiModelMetadataEntity?> getByModelVersion(String version);

  Future<void> addMetadata(AiModelMetadataEntity entity);

  Future<void> updateMetadata(AiModelMetadataEntity entity);
}
