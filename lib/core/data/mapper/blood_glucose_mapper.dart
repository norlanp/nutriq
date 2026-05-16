// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';

BloodGlucoseLabelType mapBloodGlucoseLabelStringToEntity(String label) {
  switch (label) {
    case 'beforeMeal':
      return BloodGlucoseLabelType.beforeMeal;
    case 'afterMeal':
      return BloodGlucoseLabelType.afterMeal;
    case 'bedtime':
      return BloodGlucoseLabelType.bedtime;
    default:
      return BloodGlucoseLabelType.fasting;
  }
}

String mapBloodGlucoseLabelEntityToString(BloodGlucoseLabelType label) {
  switch (label) {
    case BloodGlucoseLabelType.beforeMeal:
      return 'beforeMeal';
    case BloodGlucoseLabelType.afterMeal:
      return 'afterMeal';
    case BloodGlucoseLabelType.bedtime:
      return 'bedtime';
    case BloodGlucoseLabelType.fasting:
      return 'fasting';
  }
}

BloodGlucoseEntity mapBloodGlucoseToEntity(BloodGlucoseEntry entry) =>
    BloodGlucoseEntity(
      id: entry.id,
      userId: entry.userId,
      date: entry.date,
      timestamp: entry.timestamp,
      valueMgDl: entry.valueMgDl,
      label: mapBloodGlucoseLabelStringToEntity(entry.label),
      notes: entry.notes,
    );

BloodGlucoseEntriesCompanion mapBloodGlucoseEntityToCompanion(
        BloodGlucoseEntity entity) =>
    BloodGlucoseEntriesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      date: Value(entity.date),
      timestamp: Value(entity.timestamp),
      valueMgDl: Value(entity.valueMgDl),
      label: Value(mapBloodGlucoseLabelEntityToString(entity.label)),
      notes: Value(entity.notes),
    );