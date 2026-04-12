import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/ai_model_metadata_dao.dart';

class AiModelMetadataDataSource {
  final AiModelMetadataDao _dao;

  AiModelMetadataDataSource(this._dao);

  Future<List<AiModelMetadataEntry>> getAll() => _dao.getAll();

  Future<AiModelMetadataEntry?> getByModelVersion(String version) =>
      _dao.getByModelVersion(version);

  Future<void> insertEntry(AiModelMetadataEntriesCompanion entry) =>
      _dao.insertEntry(entry);

  Future<void> updateEntry(AiModelMetadataEntriesCompanion entry) =>
      _dao.updateEntry(entry);
}
