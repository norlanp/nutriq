import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/step_bonus/calculate_step_bonus_usecase.dart';

part 'step_bonus_event.dart';
part 'step_bonus_state.dart';

class StepBonusBloc extends Bloc<StepBonusEvent, StepBonusState> {
  final GetConfigUsecase _getConfigUsecase;
  final AddConfigUsecase _addConfigUsecase;
  final CalculateStepBonusUsecase _calculateStepBonusUsecase;

  StepBonusBloc(
    this._getConfigUsecase,
    this._addConfigUsecase,
    this._calculateStepBonusUsecase,
  ) : super(StepBonusInitial()) {
    on<LoadStepBonusConfig>(_onLoadConfig);
    on<ToggleStepBonus>(_onToggleBonus);
    on<SetStepBonusPercent>(_onSetPercent);
    on<RefreshStepCredit>(_onRefreshCredit);
  }

  Future<void> _onLoadConfig(
    LoadStepBonusConfig event,
    Emitter<StepBonusState> emit,
  ) async {
    emit(StepBonusLoading());
    try {
      final config = await _getConfigUsecase.getConfig();
      final steps = await _calculateStepBonusUsecase
          .readTodaySteps()
          .catchError((_) => 0);
      final credit = await _calculateStepBonusUsecase(
        steps: steps,
        percent: config.stepBonusPercent,
      );
      emit(StepBonusLoaded(
        isEnabled: config.stepBonusEnabled,
        percent: config.stepBonusPercent,
        todaySteps: steps,
        calorieCredit: credit,
      ));
    } catch (e) {
      emit(StepBonusError(e.toString()));
    }
  }

  Future<void> _onToggleBonus(
    ToggleStepBonus event,
    Emitter<StepBonusState> emit,
  ) async {
    final currentState = state;
    if (currentState is! StepBonusLoaded) return;

    await _addConfigUsecase.setStepBonusEnabled(event.enabled);
    emit(currentState.copyWith(isEnabled: event.enabled));
  }

  Future<void> _onSetPercent(
    SetStepBonusPercent event,
    Emitter<StepBonusState> emit,
  ) async {
    final currentState = state;
    if (currentState is! StepBonusLoaded) return;

    await _addConfigUsecase.setStepBonusPercent(event.percent);
    final credit = await _calculateStepBonusUsecase(
      steps: currentState.todaySteps,
      percent: event.percent,
    );
    emit(currentState.copyWith(
      percent: event.percent,
      calorieCredit: credit,
    ));
  }

  Future<void> _onRefreshCredit(
    RefreshStepCredit event,
    Emitter<StepBonusState> emit,
  ) async {
    final currentState = state;
    if (currentState is! StepBonusLoaded) return;

    try {
      final steps = await _calculateStepBonusUsecase
          .readTodaySteps()
          .catchError((_) => 0);
      final credit = await _calculateStepBonusUsecase(
        steps: steps,
        percent: currentState.percent,
      );
      emit(currentState.copyWith(
        todaySteps: steps,
        calorieCredit: credit,
      ));
    } catch (_) {}
  }
}
