part of 'body_measurement_bloc.dart';

abstract class BodyMeasurementState extends Equatable {
  const BodyMeasurementState();

  @override
  List<Object?> get props => [];
}

class BodyMeasurementInitial extends BodyMeasurementState {}

class BodyMeasurementLoading extends BodyMeasurementState {}

class BodyMeasurementLoaded extends BodyMeasurementState {
  final List<BodyMeasurementEntity> measurements;

  const BodyMeasurementLoaded({required this.measurements});

  @override
  List<Object?> get props => [measurements];
}

class BodyMeasurementError extends BodyMeasurementState {
  final String message;

  const BodyMeasurementError({required this.message});

  @override
  List<Object?> get props => [message];
}
