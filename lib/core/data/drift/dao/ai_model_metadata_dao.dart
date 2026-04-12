import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/ai_model_metadata_table.dart';

part 'ai_model_metadata_dao.g.dart';

@DriftAccessor(tables: [AiModelMetadataEntries])
class AiModelMetadataDao extends DatabaseAccessor<AppDatabase>
    with _$AiModelMetadataDaoMixin {
  AiModelMetadataDao(super.db);

  Future<List<AiModelMetadataEntry>> getAll() async {
    return await select(aiModelMetadataEntries).get();
  }

  Future<AiModelMetadataEntry?> getByModelVersion(String version) async {
    return await (select(aiModelMetadataEntries)
          ..where((t) => t.modelVersion.equals(version)))
        .getSingleOrNull();
  }

  Future<void> insertEntry(AiModelMetadataEntriesCompanion entry) async {
    await into(aiModelMetadataEntries).insert(entry);
  }

  Future<void> updateEntry(AiModelMetadataEntriesCompanion entry) async {
    await (update(aiModelMetadataEntries)
          ..where((t) => t.id.equals(entry.id.value)))
        .write(entry);
  }
}
