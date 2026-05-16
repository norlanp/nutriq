import 'package:freezed_annotation/freezed_annotation.dart';

part 'ai_model_metadata_entity.freezed.dart';

@freezed
abstract class AiModelMetadataEntity with _$AiModelMetadataEntity {
  const AiModelMetadataEntity._();

  const factory AiModelMetadataEntity({
    required int id,
    required String modelVersion,
    required String assetPath,
    required DateTime lastUpdated,
  }) = _AiModelMetadataEntity;
}