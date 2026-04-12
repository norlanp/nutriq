import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/usecase/water/add_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/delete_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_daily_water_total_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_water_usecase.dart';

part 'water_event.dart';
part 'water_state.dart';

class WaterBloc extends Bloc<WaterEvent, WaterState> {
  final GetWaterUsecase _getWaterUsecase;
  final AddWaterUsecase _addWaterUsecase;
  final DeleteWaterUsecase _deleteWaterUsecase;
  final GetDailyWaterTotalUsecase _getDailyWaterTotalUsecase;

  WaterBloc(
    this._getWaterUsecase,
    this._addWaterUsecase,
    this._deleteWaterUsecase,
    this._getDailyWaterTotalUsecase,
  ) : super(WaterInitial()) {
    on<LoadWater>(_onLoadWater);
    on<AddWater>(_onAddWater);
    on<DeleteWater>(_onDeleteWater);
    on<UpdateDailyGoal>(_onUpdateDailyGoal);
  }

  Future<void> _onLoadWater(LoadWater event, Emitter<WaterState> emit) async {
    emit(WaterLoading());
    try {
      final entries = await _getWaterUsecase.getWaterByDate(event.date);
      final total = await _getDailyWaterTotalUsecase.getDailyTotal(event.date);
      emit(WaterLoaded(
          entries: entries, dailyTotal: total, dailyGoal: event.dailyGoal));
    } catch (e) {
      emit(WaterError(e.toString()));
    }
  }

  Future<void> _onAddWater(AddWater event, Emitter<WaterState> emit) async {
    try {
      await _addWaterUsecase.addWater(event.entry);
      final entries = await _getWaterUsecase.getWaterByDate(event.date);
      final total = await _getDailyWaterTotalUsecase.getDailyTotal(event.date);
      emit(WaterLoaded(
          entries: entries, dailyTotal: total, dailyGoal: event.dailyGoal));
    } catch (e) {
      emit(WaterError(e.toString()));
    }
  }

  Future<void> _onDeleteWater(
      DeleteWater event, Emitter<WaterState> emit) async {
    try {
      await _deleteWaterUsecase.deleteWater(event.entry);
      final entries = await _getWaterUsecase.getWaterByDate(event.date);
      final total = await _getDailyWaterTotalUsecase.getDailyTotal(event.date);
      emit(WaterLoaded(
          entries: entries, dailyTotal: total, dailyGoal: event.dailyGoal));
    } catch (e) {
      emit(WaterError(e.toString()));
    }
  }

  Future<void> _onUpdateDailyGoal(
      UpdateDailyGoal event, Emitter<WaterState> emit) async {
    final currentState = state;
    if (currentState is WaterLoaded) {
      emit(WaterLoaded(
        entries: currentState.entries,
        dailyTotal: currentState.dailyTotal,
        dailyGoal: event.dailyGoal,
      ));
    }
  }
}
