import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/autopilot/presentation/notifier/autopilot_state.dart';

class AutopilotNotifier extends Notifier<AutopilotState> {
  @override
  AutopilotState build() => const AutopilotState();

  Future<void> loadStatus(int userId) async {
    state = const AutopilotState(isLoading: true);
    try {
      final entity = await ref.read(getAutopilotStatusUsecaseProvider)(userId);
      final baselineKcal = await ref
          .read(getKcalGoalUsecaseProvider)
          .getKcalGoal()
          .then((v) => v.round());
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      if (entity != null) {
        state = AutopilotState(
          baselineCalories: entity.baselineCalorieBudget,
          adjustedCalories: entity.adjustedCalorieBudget,
          isEnabled: entity.isEnabled,
          lastAdjustmentDate: entity.lastAdjustmentDate,
          exerciseCalorieMode: config.exerciseCalorieMode,
          exerciseCreditPercent: config.exerciseCreditPercent,
        );
      } else {
        state = AutopilotState(
          baselineCalories: baselineKcal,
          adjustedCalories: baselineKcal,
          isEnabled: false,
          lastAdjustmentDate: DateTime.now(),
          exerciseCalorieMode: config.exerciseCalorieMode,
          exerciseCreditPercent: config.exerciseCreditPercent,
        );
      }
    } catch (e) {
      state = AutopilotState(errorMessage: e.toString());
    }
  }

  Future<void> toggleAutopilot(int userId, bool enabled, int baselineCalories) async {
    try {
      await ref.read(toggleAutopilotUsecaseProvider)(userId, enabled, baselineCalories);
      final entity = await ref.read(getAutopilotStatusUsecaseProvider)(userId);
      state = AutopilotState(
        baselineCalories: entity?.baselineCalorieBudget ?? baselineCalories,
        adjustedCalories: entity?.adjustedCalorieBudget ?? baselineCalories,
        isEnabled: enabled,
        lastAdjustmentDate: entity?.lastAdjustmentDate ?? DateTime.now(),
        exerciseCalorieMode: state.exerciseCalorieMode,
        exerciseCreditPercent: state.exerciseCreditPercent,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> recalculateBudget(int userId, int baselineCalories) async {
    state = state.copyWith(isLoading: true);
    try {
      final entity = await ref.read(adjustBudgetUsecaseProvider)(userId, baselineCalories);
      state = AutopilotState(
        baselineCalories: entity.baselineCalorieBudget,
        adjustedCalories: entity.adjustedCalorieBudget,
        isEnabled: entity.isEnabled,
        lastAdjustmentDate: entity.lastAdjustmentDate,
        exerciseCalorieMode: state.exerciseCalorieMode,
        exerciseCreditPercent: state.exerciseCreditPercent,
      );
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  Future<void> toggleExerciseCredit(ExerciseCalorieModeEntity mode) async {
    final creditPercent = mode == ExerciseCalorieModeEntity.custom
        ? state.exerciseCreditPercent
        : mode.defaultPercent;

    await ref.read(addConfigUsecaseProvider).setConfigExerciseCalorieMode(mode);
    await ref.read(addConfigUsecaseProvider).setConfigExerciseCreditPercent(creditPercent);

    state = state.copyWith(
      exerciseCalorieMode: mode,
      exerciseCreditPercent: creditPercent,
    );
  }

  Future<void> setExerciseCreditPercent(double percent) async {
    await ref.read(addConfigUsecaseProvider).setConfigExerciseCreditPercent(percent);
    state = state.copyWith(exerciseCreditPercent: percent);
  }
}

final autopilotNotifierProvider =
    NotifierProvider<AutopilotNotifier, AutopilotState>(AutopilotNotifier.new);