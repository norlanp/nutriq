import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';

class BodyMeasurementState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<BodyMeasurementEntity> measurements;

  const BodyMeasurementState({
    this.isLoading = false,
    this.errorMessage,
    this.measurements = const [],
  });

  bool get hasError => errorMessage != null;

  @override
  List<Object?> get props => [isLoading, errorMessage, measurements];
}