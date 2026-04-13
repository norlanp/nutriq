part of 'medication_bloc.dart';

abstract class MedicationEvent extends Equatable {
  const MedicationEvent();

  @override
  List<Object?> get props => [];
}

class LoadMedications extends MedicationEvent {
  final int userId;

  const LoadMedications({required this.userId});

  @override
  List<Object?> get props => [userId];
}

class AddMedication extends MedicationEvent {
  final MedicationEntity medication;
  final int userId;

  const AddMedication({required this.medication, required this.userId});

  @override
  List<Object?> get props => [medication, userId];
}

class DeleteMedication extends MedicationEvent {
  final int medicationId;
  final int userId;

  const DeleteMedication({required this.medicationId, required this.userId});

  @override
  List<Object?> get props => [medicationId, userId];
}

class LogDose extends MedicationEvent {
  final MedicationLogEntity log;
  final DateTime date;

  const LogDose({required this.log, required this.date});

  @override
  List<Object?> get props => [log, date];
}

class LoadLog extends MedicationEvent {
  final DateTime date;

  const LoadLog({required this.date});

  @override
  List<Object?> get props => [date];
}
