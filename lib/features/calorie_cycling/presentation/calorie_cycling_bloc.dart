import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/get_calorie_cycle_usecase.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/save_calorie_cycle_usecase.dart';

part 'calorie_cycling_event.dart';
part 'calorie_cycling_state.dart';

class CalorieCyclingBloc
    extends Bloc<CalorieCyclingEvent, CalorieCyclingState> {
  final GetCalorieCycleUsecase _getCycleUsecase;
  final SaveCalorieCycleUsecase _saveCycleUsecase;

  CalorieCyclingBloc(
    this._getCycleUsecase,
    this._saveCycleUsecase,
  ) : super(CalorieCyclingInitial()) {
    on<LoadCycle>(_onLoadCycle);
    on<SaveCycle>(_onSaveCycle);
    on<ToggleCycling>(_onToggleCycling);
  }

  Future<void> _onLoadCycle(
    LoadCycle event,
    Emitter<CalorieCyclingState> emit,
  ) async {
    emit(CalorieCyclingLoading());
    try {
      final entity = await _getCycleUsecase();
      emit(CalorieCyclingLoaded(
        weekdayCalorieMap: entity.weekdayCalorieMap,
        isEnabled: entity.isEnabled,
      ));
    } catch (e) {
      emit(CalorieCyclingError(e.toString()));
    }
  }

  Future<void> _onSaveCycle(
    SaveCycle event,
    Emitter<CalorieCyclingState> emit,
  ) async {
    try {
      final entity = CalorieCycleEntity(
        weekdayCalorieMap: event.weekdayCalorieMap,
        isEnabled: true,
      );
      await _saveCycleUsecase(entity);
      emit(CalorieCyclingLoaded(
        weekdayCalorieMap: event.weekdayCalorieMap,
        isEnabled: true,
      ));
      emit(CalorieCyclingSaved());
      emit(CalorieCyclingLoaded(
        weekdayCalorieMap: event.weekdayCalorieMap,
        isEnabled: true,
      ));
    } catch (e) {
      emit(CalorieCyclingError(e.toString()));
    }
  }

  Future<void> _onToggleCycling(
    ToggleCycling event,
    Emitter<CalorieCyclingState> emit,
  ) async {
    try {
      final currentState = state;
      Map<int, double> currentMap = {};
      if (currentState is CalorieCyclingLoaded) {
        currentMap = currentState.weekdayCalorieMap;
      }
      final entity = CalorieCycleEntity(
        weekdayCalorieMap: currentMap,
        isEnabled: event.enabled,
      );
      await _saveCycleUsecase(entity);
      emit(CalorieCyclingLoaded(
        weekdayCalorieMap: currentMap,
        isEnabled: event.enabled,
      ));
    } catch (e) {
      emit(CalorieCyclingError(e.toString()));
    }
  }
}
