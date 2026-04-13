part of 'symptom_bloc.dart';

abstract class SymptomState extends Equatable {
  const SymptomState();

  @override
  List<Object?> get props => [];
}

class SymptomInitial extends SymptomState {}

class SymptomLoading extends SymptomState {}

class SymptomLoaded extends SymptomState {
  final List<SymptomEntity> symptoms;

  const SymptomLoaded({required this.symptoms});

  @override
  List<Object?> get props => [symptoms];
}

class SymptomError extends SymptomState {
  final String message;

  const SymptomError(this.message);

  @override
  List<Object?> get props => [message];
}
