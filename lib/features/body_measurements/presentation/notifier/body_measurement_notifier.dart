import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/features/body_measurement/providers/body_measurement_providers.dart';
import 'package:nutriq/features/body_measurements/presentation/notifier/body_measurement_state.dart';

class BodyMeasurementNotifier extends Notifier<BodyMeasurementState> {
  @override
  BodyMeasurementState build() => const BodyMeasurementState();

  Future<void> loadMeasurements(DateTime startDate, DateTime endDate) async {
    state = BodyMeasurementState(isLoading: true, measurements: state.measurements);
    try {
      final measurements = await ref
          .read(getBodyMeasurementsUsecaseProvider)
          .getBetweenDates(startDate, endDate);
      state = BodyMeasurementState(measurements: measurements);
    } catch (e) {
      state = BodyMeasurementState(
        measurements: state.measurements,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> addMeasurement(
      BodyMeasurementEntity measurement, DateTime startDate, DateTime endDate) async {
    state = BodyMeasurementState(isLoading: true, measurements: state.measurements);
    try {
      await ref.read(addBodyMeasurementUsecaseProvider)(measurement);
      final measurements = await ref
          .read(getBodyMeasurementsUsecaseProvider)
          .getBetweenDates(startDate, endDate);
      state = BodyMeasurementState(measurements: measurements);
    } catch (e) {
      state = BodyMeasurementState(
        measurements: state.measurements,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> deleteMeasurement(
      BodyMeasurementEntity measurement, DateTime startDate, DateTime endDate) async {
    state = BodyMeasurementState(isLoading: true, measurements: state.measurements);
    try {
      await ref.read(deleteBodyMeasurementUsecaseProvider)(measurement);
      final measurements = await ref
          .read(getBodyMeasurementsUsecaseProvider)
          .getBetweenDates(startDate, endDate);
      state = BodyMeasurementState(measurements: measurements);
    } catch (e) {
      state = BodyMeasurementState(
        measurements: state.measurements,
        errorMessage: e.toString(),
      );
    }
  }
}

final bodyMeasurementNotifierProvider =
    NotifierProvider<BodyMeasurementNotifier, BodyMeasurementState>(
        BodyMeasurementNotifier.new);