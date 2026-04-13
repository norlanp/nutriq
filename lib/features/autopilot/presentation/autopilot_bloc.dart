import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/domain/usecase/autopilot/adjust_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/calculate_exercise_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/get_autopilot_status_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/toggle_autopilot_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';

part 'autopilot_event.dart';
part 'autopilot_state.dart';

class AutopilotBloc extends Bloc<AutopilotEvent, AutopilotState> {
  final GetAutopilotStatusUsecase _getStatusUsecase;
  final ToggleAutopilotUsecase _toggleUsecase;
  final AdjustBudgetUsecase _adjustBudgetUsecase;
  final GetKcalGoalUsecase _getKcalGoalUsecase;
  final GetConfigUsecase _getConfigUsecase;
  final AddConfigUsecase _addConfigUsecase;
  final CalculateExerciseBudgetUsecase _calculateExerciseBudgetUsecase;

  AutopilotBloc(
    this._getStatusUsecase,
    this._toggleUsecase,
    this._adjustBudgetUsecase,
    this._getKcalGoalUsecase,
    this._getConfigUsecase,
    this._addConfigUsecase,
    this._calculateExerciseBudgetUsecase,
  ) : super(AutopilotInitial()) {
    on<LoadAutopilotStatus>(_onLoadStatus);
    on<ToggleAutopilot>(_onToggle);
    on<RecalculateBudget>(_onRecalculate);
    on<ToggleExerciseCredit>(_onToggleExerciseCredit);
    on<SetExerciseCreditPercent>(_onSetExerciseCreditPercent);
  }

  Future<void> _onLoadStatus(
    LoadAutopilotStatus event,
    Emitter<AutopilotState> emit,
  ) async {
    emit(AutopilotLoading());
    try {
      final entity = await _getStatusUsecase(event.userId);
      final baselineKcal = await _getKcalGoalUsecase.getKcalGoal().then(
            (v) => v.round(),
          );
      final config = await _getConfigUsecase.getConfig();
      if (entity != null) {
        emit(AutopilotLoaded(
          baselineCalories: entity.baselineCalorieBudget,
          adjustedCalories: entity.adjustedCalorieBudget,
          isEnabled: entity.isEnabled,
          lastAdjustmentDate: entity.lastAdjustmentDate,
          exerciseCalorieMode: config.exerciseCalorieMode,
          exerciseCreditPercent: config.exerciseCreditPercent,
        ));
      } else {
        emit(AutopilotLoaded(
          baselineCalories: baselineKcal,
          adjustedCalories: baselineKcal,
          isEnabled: false,
          lastAdjustmentDate: DateTime.now(),
          exerciseCalorieMode: config.exerciseCalorieMode,
          exerciseCreditPercent: config.exerciseCreditPercent,
        ));
      }
    } catch (e) {
      emit(AutopilotError(e.toString()));
    }
  }

  Future<void> _onToggle(
    ToggleAutopilot event,
    Emitter<AutopilotState> emit,
  ) async {
    try {
      await _toggleUsecase(event.userId, event.enabled, event.baselineCalories);
      final entity = await _getStatusUsecase(event.userId);
      final currentState = state;
      emit(AutopilotLoaded(
        baselineCalories:
            entity?.baselineCalorieBudget ?? event.baselineCalories,
        adjustedCalories:
            entity?.adjustedCalorieBudget ?? event.baselineCalories,
        isEnabled: event.enabled,
        lastAdjustmentDate: entity?.lastAdjustmentDate ?? DateTime.now(),
        exerciseCalorieMode: currentState is AutopilotLoaded
            ? currentState.exerciseCalorieMode
            : ExerciseCalorieModeEntity.half,
        exerciseCreditPercent: currentState is AutopilotLoaded
            ? currentState.exerciseCreditPercent
            : 0.5,
      ));
    } catch (e) {
      emit(AutopilotError(e.toString()));
    }
  }

  Future<void> _onRecalculate(
    RecalculateBudget event,
    Emitter<AutopilotState> emit,
  ) async {
    final currentState = state;
    if (currentState is AutopilotLoaded) {
      emit(AutopilotLoading());
    }
    try {
      final entity = await _adjustBudgetUsecase(
        event.userId,
        event.baselineCalories,
      );
      emit(AutopilotLoaded(
        baselineCalories: entity.baselineCalorieBudget,
        adjustedCalories: entity.adjustedCalorieBudget,
        isEnabled: entity.isEnabled,
        lastAdjustmentDate: entity.lastAdjustmentDate,
        exerciseCalorieMode: currentState is AutopilotLoaded
            ? currentState.exerciseCalorieMode
            : ExerciseCalorieModeEntity.half,
        exerciseCreditPercent: currentState is AutopilotLoaded
            ? currentState.exerciseCreditPercent
            : 0.5,
      ));
    } catch (e) {
      emit(AutopilotError(e.toString()));
    }
  }

  Future<void> _onToggleExerciseCredit(
    ToggleExerciseCredit event,
    Emitter<AutopilotState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AutopilotLoaded) return;

    await _addConfigUsecase.setConfigExerciseCalorieMode(event.mode);

    final creditPercent = event.mode == ExerciseCalorieModeEntity.custom
        ? currentState.exerciseCreditPercent
        : event.mode.defaultPercent;

    await _addConfigUsecase.setConfigExerciseCreditPercent(creditPercent);

    emit(currentState.copyWith(
      exerciseCalorieMode: event.mode,
      exerciseCreditPercent: creditPercent,
    ));
  }

  Future<void> _onSetExerciseCreditPercent(
    SetExerciseCreditPercent event,
    Emitter<AutopilotState> emit,
  ) async {
    final currentState = state;
    if (currentState is! AutopilotLoaded) return;

    await _addConfigUsecase.setConfigExerciseCreditPercent(event.percent);

    emit(currentState.copyWith(
      exerciseCreditPercent: event.percent,
    ));
  }
}
