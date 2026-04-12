import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/add_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/delete_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/get_body_measurements_usecase.dart';

part 'body_measurement_event.dart';
part 'body_measurement_state.dart';

class BodyMeasurementBloc
    extends Bloc<BodyMeasurementEvent, BodyMeasurementState> {
  final GetBodyMeasurementsUsecase _getMeasurements;
  final AddBodyMeasurementUsecase _addMeasurement;
  final DeleteBodyMeasurementUsecase _deleteMeasurement;

  BodyMeasurementBloc({
    required GetBodyMeasurementsUsecase getMeasurements,
    required AddBodyMeasurementUsecase addMeasurement,
    required DeleteBodyMeasurementUsecase deleteMeasurement,
  })  : _getMeasurements = getMeasurements,
        _addMeasurement = addMeasurement,
        _deleteMeasurement = deleteMeasurement,
        super(BodyMeasurementInitial()) {
    on<LoadMeasurements>(_onLoadMeasurements);
    on<AddMeasurement>(_onAddMeasurement);
    on<DeleteMeasurement>(_onDeleteMeasurement);
  }

  Future<void> _onLoadMeasurements(
      LoadMeasurements event, Emitter<BodyMeasurementState> emit) async {
    emit(BodyMeasurementLoading());
    try {
      final measurements = await _getMeasurements.getBetweenDates(
          event.startDate, event.endDate);
      emit(BodyMeasurementLoaded(measurements: measurements));
    } catch (e) {
      emit(BodyMeasurementError(message: e.toString()));
    }
  }

  Future<void> _onAddMeasurement(
      AddMeasurement event, Emitter<BodyMeasurementState> emit) async {
    try {
      await _addMeasurement(event.measurement);
      final measurements = await _getMeasurements.getBetweenDates(
          event.startDate, event.endDate);
      emit(BodyMeasurementLoaded(measurements: measurements));
    } catch (e) {
      emit(BodyMeasurementError(message: e.toString()));
    }
  }

  Future<void> _onDeleteMeasurement(
      DeleteMeasurement event, Emitter<BodyMeasurementState> emit) async {
    try {
      await _deleteMeasurement(event.measurement);
      final measurements = await _getMeasurements.getBetweenDates(
          event.startDate, event.endDate);
      emit(BodyMeasurementLoaded(measurements: measurements));
    } catch (e) {
      emit(BodyMeasurementError(message: e.toString()));
    }
  }
}
