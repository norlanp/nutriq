import 'package:equatable/equatable.dart';

enum MedicationFrequencyType { daily, weekly, asNeeded }

class MedicationEntity extends Equatable {
  final int id;
  final int userId;
  final String name;
  final String dosage;
  final MedicationFrequencyType frequency;
  final int timesPerDay;
  final String? notes;

  const MedicationEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.timesPerDay,
    this.notes,
  });

  @override
  List<Object?> get props =>
      [id, userId, name, dosage, frequency, timesPerDay, notes];
}
