import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/core/domain/usecase/symptom/add_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/delete_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/get_symptoms_usecase.dart';

part 'symptom_event.dart';
part 'symptom_state.dart';

class SymptomBloc extends Bloc<SymptomEvent, SymptomState> {
  final GetSymptomsUsecase _getSymptomsUsecase;
  final AddSymptomUsecase _addSymptomUsecase;
  final DeleteSymptomUsecase _deleteSymptomUsecase;

  SymptomBloc(
    this._getSymptomsUsecase,
    this._addSymptomUsecase,
    this._deleteSymptomUsecase,
  ) : super(SymptomInitial()) {
    on<LoadSymptoms>(_onLoadSymptoms);
    on<AddSymptom>(_onAddSymptom);
    on<DeleteSymptom>(_onDeleteSymptom);
  }

  Future<void> _onLoadSymptoms(
    LoadSymptoms event,
    Emitter<SymptomState> emit,
  ) async {
    emit(SymptomLoading());
    try {
      final symptoms = await _getSymptomsUsecase.getSymptomsByDateRange(
        event.startDate,
        event.endDate,
      );
      emit(SymptomLoaded(symptoms: symptoms));
    } catch (e) {
      emit(SymptomError(e.toString()));
    }
  }

  Future<void> _onAddSymptom(
    AddSymptom event,
    Emitter<SymptomState> emit,
  ) async {
    try {
      await _addSymptomUsecase.addSymptom(event.symptom);
      final symptoms = await _getSymptomsUsecase.getSymptomsByDateRange(
        event.startDate,
        event.endDate,
      );
      emit(SymptomLoaded(symptoms: symptoms));
    } catch (e) {
      emit(SymptomError(e.toString()));
    }
  }

  Future<void> _onDeleteSymptom(
    DeleteSymptom event,
    Emitter<SymptomState> emit,
  ) async {
    try {
      await _deleteSymptomUsecase.deleteSymptom(event.symptom);
      final symptoms = await _getSymptomsUsecase.getSymptomsByDateRange(
        event.startDate,
        event.endDate,
      );
      emit(SymptomLoaded(symptoms: symptoms));
    } catch (e) {
      emit(SymptomError(e.toString()));
    }
  }
}
