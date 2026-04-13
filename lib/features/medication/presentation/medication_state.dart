part of 'medication_bloc.dart';

abstract class MedicationState extends Equatable {
  const MedicationState();

  @override
  List<Object?> get props => [];
}

class MedicationInitial extends MedicationState {}

class MedicationLoading extends MedicationState {}

class MedicationsLoaded extends MedicationState {
  final List<MedicationEntity> medications;

  const MedicationsLoaded(this.medications);

  @override
  List<Object?> get props => [medications];
}

class MedicationLogLoaded extends MedicationState {
  final List<MedicationLogEntity> logs;

  const MedicationLogLoaded(this.logs);

  @override
  List<Object?> get props => [logs];
}

class MedicationError extends MedicationState {
  final String message;

  const MedicationError(this.message);

  @override
  List<Object?> get props => [message];
}
