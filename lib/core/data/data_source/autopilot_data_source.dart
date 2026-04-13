import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/autopilot_dao.dart';

class AutopilotDataSource {
  final AutopilotDao _dao;

  AutopilotDataSource(this._dao);

  Future<AutopilotEntry?> getSettings(int userId) => _dao.getSettings(userId);

  Future<void> upsertSettings(AutopilotEntriesCompanion companion) =>
      _dao.upsertSettings(companion);
}
