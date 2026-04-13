import 'package:nutriq/core/data/data_source/autopilot_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/autopilot_entity.dart';
import 'package:nutriq/core/domain/repository/autopilot_repository.dart'
    as domain;

class AutopilotRepository implements domain.AutopilotRepository {
  final AutopilotDataSource _autopilotDataSource;

  AutopilotRepository(this._autopilotDataSource);

  @override
  Future<AutopilotEntity?> getAutopilotSettings(int userId) async {
    final entry = await _autopilotDataSource.getSettings(userId);
    return entry == null ? null : mapAutopilotToEntity(entry);
  }

  @override
  Future<void> saveAutopilotSettings(AutopilotEntity entity) async {
    final companion = mapAutopilotEntityToCompanion(entity);
    await _autopilotDataSource.upsertSettings(companion);
  }
}
