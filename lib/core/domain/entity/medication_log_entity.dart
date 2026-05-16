import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_log_entity.freezed.dart';

@freezed
class MedicationLogEntity with _$MedicationLogEntity {
  const factory MedicationLogEntity({
    required int id,
    required int userId,
    required int medicationId,
    required DateTime date,
    required DateTime timestamp,
    required bool doseTaken,
    String? notes,
  }) = _MedicationLogEntity;

  const MedicationLogEntity._();
}