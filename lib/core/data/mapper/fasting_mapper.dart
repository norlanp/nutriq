// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';

FastingPresetType _mapPresetTypeStringToEntity(String type) {
  switch (type) {
    case 'sixteenEight':
      return FastingPresetType.sixteenEight;
    case 'eighteenSix':
      return FastingPresetType.eighteenSix;
    case 'twentyFour':
      return FastingPresetType.twentyFour;
    case 'omad':
      return FastingPresetType.omad;
    default:
      return FastingPresetType.custom;
  }
}

String _mapPresetTypeEntityToString(FastingPresetType type) {
  switch (type) {
    case FastingPresetType.sixteenEight:
      return 'sixteenEight';
    case FastingPresetType.eighteenSix:
      return 'eighteenSix';
    case FastingPresetType.twentyFour:
      return 'twentyFour';
    case FastingPresetType.omad:
      return 'omad';
    case FastingPresetType.custom:
      return 'custom';
  }
}

FastingEntity mapFastingToEntity(Fast entry) => FastingEntity(
      id: entry.id,
      userId: entry.userId,
      startTime: entry.startTime,
      endTime: entry.endTime,
      targetDurationMinutes: entry.targetDurationMinutes,
      presetType: _mapPresetTypeStringToEntity(entry.presetType),
    );

FastsCompanion mapFastingEntityToCompanion(FastingEntity entity) =>
    FastsCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      startTime: Value(entity.startTime),
      endTime: Value(entity.endTime),
      targetDurationMinutes: Value(entity.targetDurationMinutes),
      presetType: Value(_mapPresetTypeEntityToString(entity.presetType)),
    );