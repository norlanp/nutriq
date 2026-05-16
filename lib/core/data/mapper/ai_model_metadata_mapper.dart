// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/ai_model_metadata_entity.dart';

AiModelMetadataEntity mapAiModelMetadataToEntity(
        AiModelMetadataEntry entry) =>
    AiModelMetadataEntity(
      id: entry.id,
      modelVersion: entry.modelVersion,
      assetPath: entry.assetPath,
      lastUpdated: entry.lastUpdated,
    );

AiModelMetadataEntriesCompanion mapAiModelMetadataEntityToCompanion(
        AiModelMetadataEntity entity) =>
    AiModelMetadataEntriesCompanion(
      id: Value(entity.id),
      modelVersion: Value(entity.modelVersion),
      assetPath: Value(entity.assetPath),
      lastUpdated: Value(entity.lastUpdated),
    );