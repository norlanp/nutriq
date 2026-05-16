import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/autopilot_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/autopilot_dao.dart';
import 'package:nutriq/core/data/repository/autopilot_repository.dart';
import 'package:nutriq/core/domain/entity/autopilot_entity.dart';

void main() {
  late AppDatabase db;
  late AutopilotRepository repo;

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = AutopilotRepository(AutopilotDataSource(AutopilotDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('getAutopilotSettings returns null initially', () async {
    final result = await repo.getAutopilotSettings(1);
    expect(result, isNull);
  });

  test('saveAutopilotSettings persists and getAutopilotSettings retrieves', () async {
    final entity = AutopilotEntity(
      id: 1,
      userId: 1,
      baselineCalorieBudget: 2000,
      adjustedCalorieBudget: 1800,
      lastAdjustmentDate: DateTime(2024, 6, 15),
      adjustmentHistoryKcal: [2000, 1900, 1800],
      isEnabled: true,
    );
    await repo.saveAutopilotSettings(entity);
    final result = await repo.getAutopilotSettings(1);
    expect(result, isNotNull);
    expect(result!.baselineCalorieBudget, 2000);
    expect(result.adjustedCalorieBudget, 1800);
    expect(result.isEnabled, true);
  });
}