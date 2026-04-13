part of 'symptom_bloc.dart';

abstract class SymptomEvent extends Equatable {
  const SymptomEvent();

  @override
  List<Object?> get props => [];
}

class LoadSymptoms extends SymptomEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadSymptoms({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}

class AddSymptom extends SymptomEvent {
  final SymptomEntity symptom;
  final DateTime startDate;
  final DateTime endDate;

  const AddSymptom({
    required this.symptom,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [symptom, startDate, endDate];
}

class DeleteSymptom extends SymptomEvent {
  final SymptomEntity symptom;
  final DateTime startDate;
  final DateTime endDate;

  const DeleteSymptom({
    required this.symptom,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object?> get props => [symptom, startDate, endDate];
}
