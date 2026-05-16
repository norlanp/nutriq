import 'package:freezed_annotation/freezed_annotation.dart';

part 'medication_entity.freezed.dart';

enum MedicationFrequencyType { daily, weekly, asNeeded }

@freezed
abstract class MedicationEntity with _$MedicationEntity {
  const factory MedicationEntity({
    required int id,
    required int userId,
    required String name,
    required String dosage,
    required MedicationFrequencyType frequency,
    required int timesPerDay,
    String? notes,
  }) = _MedicationEntity;

  const MedicationEntity._();
}