// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';

MedicationFrequencyType mapMedicationFrequencyStringToEntity(String frequency) {
  switch (frequency) {
    case 'weekly':
      return MedicationFrequencyType.weekly;
    case 'asNeeded':
      return MedicationFrequencyType.asNeeded;
    default:
      return MedicationFrequencyType.daily;
  }
}

String mapMedicationFrequencyEntityToString(MedicationFrequencyType frequency) {
  switch (frequency) {
    case MedicationFrequencyType.weekly:
      return 'weekly';
    case MedicationFrequencyType.asNeeded:
      return 'asNeeded';
    case MedicationFrequencyType.daily:
      return 'daily';
  }
}

MedicationEntity mapMedicationToEntity(Medication entry) => MedicationEntity(
      id: entry.id,
      userId: entry.userId,
      name: entry.name,
      dosage: entry.dosage,
      frequency: mapMedicationFrequencyStringToEntity(entry.frequency),
      timesPerDay: entry.timesPerDay,
      notes: entry.notes,
    );

MedicationsCompanion mapMedicationEntityToCompanion(MedicationEntity entity) =>
    MedicationsCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      name: Value(entity.name),
      dosage: Value(entity.dosage),
      frequency: Value(mapMedicationFrequencyEntityToString(entity.frequency)),
      timesPerDay: Value(entity.timesPerDay),
      notes: Value(entity.notes),
    );

MedicationLogEntity mapMedicationLogToEntity(MedicationLog entry) =>
    MedicationLogEntity(
      id: entry.id,
      userId: entry.userId,
      medicationId: entry.medicationId,
      date: entry.date,
      timestamp: entry.timestamp,
      doseTaken: entry.doseTaken,
      notes: entry.notes,
    );

MedicationLogsCompanion mapMedicationLogEntityToCompanion(
        MedicationLogEntity entity) =>
    MedicationLogsCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      medicationId: Value(entity.medicationId),
      date: Value(entity.date),
      timestamp: Value(entity.timestamp),
      doseTaken: Value(entity.doseTaken),
      notes: Value(entity.notes),
    );