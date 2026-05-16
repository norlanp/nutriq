// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';

SymptomEntity mapSymptomToEntity(SymptomEntry entry) => SymptomEntity(
      id: entry.id,
      userId: entry.userId,
      date: entry.date,
      timestamp: entry.timestamp,
      type: entry.type,
      severity: entry.severity,
      notes: entry.notes,
    );

SymptomEntriesCompanion mapSymptomEntityToCompanion(SymptomEntity entity) =>
    SymptomEntriesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      date: Value(entity.date),
      timestamp: Value(entity.timestamp),
      type: Value(entity.type),
      severity: Value(entity.severity),
      notes: Value(entity.notes),
    );