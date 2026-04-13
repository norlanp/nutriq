part of 'blood_glucose_bloc.dart';

abstract class BloodGlucoseState extends Equatable {
  const BloodGlucoseState();

  @override
  List<Object?> get props => [];
}

class BloodGlucoseInitial extends BloodGlucoseState {}

class BloodGlucoseLoading extends BloodGlucoseState {}

class BloodGlucoseLoaded extends BloodGlucoseState {
  final List<BloodGlucoseEntity> entries;

  const BloodGlucoseLoaded({required this.entries});

  @override
  List<Object?> get props => [entries];
}

class BloodGlucoseAverageLoaded extends BloodGlucoseState {
  final double average;

  const BloodGlucoseAverageLoaded({required this.average});

  @override
  List<Object?> get props => [average];
}

class BloodGlucoseError extends BloodGlucoseState {
  final String message;

  const BloodGlucoseError(this.message);

  @override
  List<Object?> get props => [message];
}
