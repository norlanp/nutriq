// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/autopilot_entity.dart';

AutopilotEntity mapAutopilotToEntity(AutopilotEntry entry) => AutopilotEntity(
      id: entry.id,
      userId: entry.userId,
      baselineCalorieBudget: entry.baselineCalorieBudget,
      adjustedCalorieBudget: entry.adjustedCalorieBudget,
      lastAdjustmentDate: entry.lastAdjustmentDate,
      adjustmentHistoryKcal: [],
      isEnabled: entry.isEnabled != 0,
    );

AutopilotEntriesCompanion mapAutopilotEntityToCompanion(
        AutopilotEntity entity) =>
    AutopilotEntriesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      baselineCalorieBudget: Value(entity.baselineCalorieBudget),
      adjustedCalorieBudget: Value(entity.adjustedCalorieBudget),
      lastAdjustmentDate: Value(entity.lastAdjustmentDate),
      isEnabled: Value(entity.isEnabled ? 1 : 0),
    );