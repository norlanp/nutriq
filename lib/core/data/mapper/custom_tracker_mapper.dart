// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';

TrackerType _mapTrackerTypeStringToEntity(String type) {
  switch (type) {
    case 'boolean':
      return TrackerType.boolean;
    case 'text':
      return TrackerType.text;
    default:
      return TrackerType.scale;
  }
}

String _mapTrackerTypeEntityToString(TrackerType type) {
  switch (type) {
    case TrackerType.boolean:
      return 'boolean';
    case TrackerType.text:
      return 'text';
    case TrackerType.scale:
      return 'scale';
  }
}

CustomTrackerEntity mapCustomTrackerToEntity(CustomTracker entry) =>
    CustomTrackerEntity(
      id: entry.id,
      userId: entry.userId,
      name: entry.name,
      type: _mapTrackerTypeStringToEntity(entry.type),
      min: entry.min,
      max: entry.max,
      icon: entry.icon,
      unit: entry.unit,
    );

CustomTrackersCompanion mapCustomTrackerEntityToCompanion(
        CustomTrackerEntity entity) =>
    CustomTrackersCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      name: Value(entity.name),
      type: Value(_mapTrackerTypeEntityToString(entity.type)),
      min: Value(entity.min),
      max: Value(entity.max),
      icon: Value(entity.icon),
      unit: Value(entity.unit),
    );

CustomTrackerEntryEntity mapCustomTrackerEntryToEntity(
        CustomTrackerEntry entry) =>
    CustomTrackerEntryEntity(
      id: entry.id,
      userId: entry.userId,
      trackerId: entry.trackerId,
      date: entry.date,
      value: entry.value,
      textValue: entry.textValue,
    );

CustomTrackerEntriesCompanion mapCustomTrackerEntryEntityToCompanion(
        CustomTrackerEntryEntity entity) =>
    CustomTrackerEntriesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      trackerId: Value(entity.trackerId),
      date: Value(entity.date),
      value: Value(entity.value),
      textValue: Value(entity.textValue),
    );