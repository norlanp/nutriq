import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/core/domain/usecase/medication/add_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/delete_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/log_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medication_log_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medications_usecase.dart';

part 'medication_event.dart';
part 'medication_state.dart';

class MedicationBloc extends Bloc<MedicationEvent, MedicationState> {
  final AddMedicationUsecase _addMedicationUsecase;
  final DeleteMedicationUsecase _deleteMedicationUsecase;
  final LogMedicationUsecase _logMedicationUsecase;
  final GetMedicationLogUsecase _getMedicationLogUsecase;
  final GetMedicationsUsecase _getMedicationsUsecase;

  MedicationBloc(
    this._addMedicationUsecase,
    this._deleteMedicationUsecase,
    this._logMedicationUsecase,
    this._getMedicationLogUsecase,
    this._getMedicationsUsecase,
  ) : super(MedicationInitial()) {
    on<LoadMedications>(_onLoadMedications);
    on<AddMedication>(_onAddMedication);
    on<DeleteMedication>(_onDeleteMedication);
    on<LogDose>(_onLogDose);
    on<LoadLog>(_onLoadLog);
  }

  Future<void> _onLoadMedications(
    LoadMedications event,
    Emitter<MedicationState> emit,
  ) async {
    emit(MedicationLoading());
    try {
      final medications =
          await _getMedicationsUsecase.getMedicationsByUserId(event.userId);
      emit(MedicationsLoaded(medications));
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> _onAddMedication(
    AddMedication event,
    Emitter<MedicationState> emit,
  ) async {
    try {
      await _addMedicationUsecase.addMedication(event.medication);
      final medications =
          await _getMedicationsUsecase.getMedicationsByUserId(event.userId);
      emit(MedicationsLoaded(medications));
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> _onDeleteMedication(
    DeleteMedication event,
    Emitter<MedicationState> emit,
  ) async {
    try {
      await _deleteMedicationUsecase.deleteMedication(event.medicationId);
      final medications =
          await _getMedicationsUsecase.getMedicationsByUserId(event.userId);
      emit(MedicationsLoaded(medications));
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> _onLogDose(
    LogDose event,
    Emitter<MedicationState> emit,
  ) async {
    try {
      await _logMedicationUsecase.logMedication(event.log);
      final logs = await _getMedicationLogUsecase.getMedicationLogs(event.date);
      emit(MedicationLogLoaded(logs));
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }

  Future<void> _onLoadLog(
    LoadLog event,
    Emitter<MedicationState> emit,
  ) async {
    emit(MedicationLoading());
    try {
      final logs = await _getMedicationLogUsecase.getMedicationLogs(event.date);
      emit(MedicationLogLoaded(logs));
    } catch (e) {
      emit(MedicationError(e.toString()));
    }
  }
}
