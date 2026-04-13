import 'package:equatable/equatable.dart';

class MedicationLogEntity extends Equatable {
  final int id;
  final int userId;
  final int medicationId;
  final DateTime date;
  final DateTime timestamp;
  final bool doseTaken;
  final String? notes;

  const MedicationLogEntity({
    required this.id,
    required this.userId,
    required this.medicationId,
    required this.date,
    required this.timestamp,
    required this.doseTaken,
    this.notes,
  });

  @override
  List<Object?> get props =>
      [id, userId, medicationId, date, timestamp, doseTaken, notes];
}
