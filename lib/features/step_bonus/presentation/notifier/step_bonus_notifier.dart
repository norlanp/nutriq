import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/step_bonus/presentation/notifier/step_bonus_state.dart';

class StepBonusNotifier extends Notifier<StepBonusState> {
  @override
  StepBonusState build() => const StepBonusState();

  Future<void> loadConfig() async {
    state = const StepBonusState(isLoading: true);
    try {
      final config = await ref.read(getConfigUsecaseProvider).getConfig();
      final steps = await ref
          .read(calculateStepBonusUsecaseProvider)
          .readTodaySteps()
          .catchError((_) => 0);
      final credit = await ref.read(calculateStepBonusUsecaseProvider)(
        steps: steps,
        percent: config.stepBonusPercent,
      );
      state = StepBonusState(
        isEnabled: config.stepBonusEnabled,
        percent: config.stepBonusPercent,
        todaySteps: steps,
        calorieCredit: credit,
        isLoaded: true,
      );
    } catch (e) {
      state = StepBonusState(errorMessage: e.toString());
    }
  }

  Future<void> toggleBonus(bool enabled) async {
    await ref.read(addConfigUsecaseProvider).setStepBonusEnabled(enabled);
    state = state.copyWith(isEnabled: enabled);
  }

  Future<void> setPercent(double percent) async {
    await ref.read(addConfigUsecaseProvider).setStepBonusPercent(percent);
    final credit = await ref.read(calculateStepBonusUsecaseProvider)(
      steps: state.todaySteps,
      percent: percent,
    );
    state = state.copyWith(percent: percent, calorieCredit: credit);
  }

  Future<void> refreshCredit() async {
    try {
      final steps = await ref
          .read(calculateStepBonusUsecaseProvider)
          .readTodaySteps()
          .catchError((_) => 0);
      final credit = await ref.read(calculateStepBonusUsecaseProvider)(
        steps: steps,
        percent: state.percent,
      );
      state = state.copyWith(todaySteps: steps, calorieCredit: credit);
    } catch (_) {}
  }
}

final stepBonusNotifierProvider =
    NotifierProvider<StepBonusNotifier, StepBonusState>(StepBonusNotifier.new);