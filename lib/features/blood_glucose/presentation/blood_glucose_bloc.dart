import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/add_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/delete_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_average_usecase.dart';

part 'blood_glucose_event.dart';
part 'blood_glucose_state.dart';

class BloodGlucoseBloc extends Bloc<BloodGlucoseEvent, BloodGlucoseState> {
  final GetBloodGlucoseUsecase _getBloodGlucoseUsecase;
  final AddBloodGlucoseUsecase _addBloodGlucoseUsecase;
  final DeleteBloodGlucoseUsecase _deleteBloodGlucoseUsecase;
  final GetBloodGlucoseAverageUsecase _getBloodGlucoseAverageUsecase;

  BloodGlucoseBloc(
    this._getBloodGlucoseUsecase,
    this._addBloodGlucoseUsecase,
    this._deleteBloodGlucoseUsecase,
    this._getBloodGlucoseAverageUsecase,
  ) : super(BloodGlucoseInitial()) {
    on<LoadBloodGlucoseEntries>(_onLoadEntries);
    on<AddBloodGlucoseEntry>(_onAddEntry);
    on<DeleteBloodGlucoseEntry>(_onDeleteEntry);
    on<LoadBloodGlucoseAverage>(_onLoadAverage);
  }

  Future<void> _onLoadEntries(
    LoadBloodGlucoseEntries event,
    Emitter<BloodGlucoseState> emit,
  ) async {
    emit(BloodGlucoseLoading());
    try {
      final entries =
          await _getBloodGlucoseUsecase.getBloodGlucoseByDate(event.date);
      emit(BloodGlucoseLoaded(entries: entries));
    } catch (e) {
      emit(BloodGlucoseError(e.toString()));
    }
  }

  Future<void> _onAddEntry(
    AddBloodGlucoseEntry event,
    Emitter<BloodGlucoseState> emit,
  ) async {
    try {
      await _addBloodGlucoseUsecase.addBloodGlucose(event.entry);
      final entries =
          await _getBloodGlucoseUsecase.getBloodGlucoseByDate(event.date);
      emit(BloodGlucoseLoaded(entries: entries));
    } catch (e) {
      emit(BloodGlucoseError(e.toString()));
    }
  }

  Future<void> _onDeleteEntry(
    DeleteBloodGlucoseEntry event,
    Emitter<BloodGlucoseState> emit,
  ) async {
    try {
      await _deleteBloodGlucoseUsecase.deleteBloodGlucose(event.entry);
      final entries =
          await _getBloodGlucoseUsecase.getBloodGlucoseByDate(event.date);
      emit(BloodGlucoseLoaded(entries: entries));
    } catch (e) {
      emit(BloodGlucoseError(e.toString()));
    }
  }

  Future<void> _onLoadAverage(
    LoadBloodGlucoseAverage event,
    Emitter<BloodGlucoseState> emit,
  ) async {
    emit(BloodGlucoseLoading());
    try {
      final average = await _getBloodGlucoseAverageUsecase.getAverage(
        event.startDate,
        event.endDate,
      );
      emit(BloodGlucoseAverageLoaded(average: average));
    } catch (e) {
      emit(BloodGlucoseError(e.toString()));
    }
  }
}
