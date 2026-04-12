part of 'body_measurement_bloc.dart';

abstract class BodyMeasurementEvent extends Equatable {
  const BodyMeasurementEvent();

  @override
  List<Object?> get props => [];
}

class LoadMeasurements extends BodyMeasurementEvent {
  final DateTime startDate;
  final DateTime endDate;

  const LoadMeasurements({required this.startDate, required this.endDate});

  @override
  List<Object?> get props => [startDate, endDate];
}

class AddMeasurement extends BodyMeasurementEvent {
  final BodyMeasurementEntity measurement;
  final DateTime startDate;
  final DateTime endDate;

  const AddMeasurement(
      {required this.measurement,
      required this.startDate,
      required this.endDate});

  @override
  List<Object?> get props => [measurement, startDate, endDate];
}

class DeleteMeasurement extends BodyMeasurementEvent {
  final BodyMeasurementEntity measurement;
  final DateTime startDate;
  final DateTime endDate;

  const DeleteMeasurement(
      {required this.measurement,
      required this.startDate,
      required this.endDate});

  @override
  List<Object?> get props => [measurement, startDate, endDate];
}
