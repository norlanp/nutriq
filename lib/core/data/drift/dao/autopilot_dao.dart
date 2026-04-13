import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/autopilot_table.dart';

part 'autopilot_dao.g.dart';

@DriftAccessor(tables: [AutopilotEntries])
class AutopilotDao extends DatabaseAccessor<AppDatabase>
    with _$AutopilotDaoMixin {
  AutopilotDao(super.db);

  Future<AutopilotEntry?> getSettings(int userId) async {
    return await (select(autopilotEntries)
          ..where((t) => t.userId.equals(userId)))
        .getSingleOrNull();
  }

  Future<void> upsertSettings(AutopilotEntriesCompanion companion) async {
    await into(autopilotEntries).insertOnConflictUpdate(companion);
  }
}
