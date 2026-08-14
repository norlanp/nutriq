import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/features/autopilot/presentation/notifier/autopilot_notifier.dart';
import 'package:nutriq/features/autopilot/presentation/notifier/autopilot_state.dart';
import 'package:nutriq/generated/l10n.dart';

class AutopilotScreen extends ConsumerStatefulWidget {
  const AutopilotScreen({super.key});

  @override
  ConsumerState<AutopilotScreen> createState() => _AutopilotScreenState();
}

class _AutopilotScreenState extends ConsumerState<AutopilotScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(autopilotNotifierProvider.notifier).loadStatus(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(autopilotNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.autopilotLabel)),
      body: _buildBody(context, l10n, state),
    );
  }

  Widget _buildBody(BuildContext context, S l10n, AutopilotState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }
    if (!state.isLoaded) {
      return const SizedBox.shrink();
    }
    return _buildContent(context, l10n, state);
  }

  Widget _buildContent(BuildContext context, S l10n, AutopilotState state) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.autopilotDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        SwitchListTile(
          title: Text(l10n.autopilotLabel),
          subtitle: Text(
            state.isEnabled ? l10n.autopilotEnabled : l10n.autopilotDisabled,
          ),
          value: state.isEnabled,
          onChanged: (value) {
            ref
                .read(autopilotNotifierProvider.notifier)
                .toggleAutopilot(0, value, state.baselineCalories);
          },
        ),
        const Divider(),
        ListTile(
          title: Text(l10n.baselineCalories),
          trailing: Text(
            '${state.baselineCalories} kcal',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
        ListTile(
          title: Text(l10n.adjustedCalories),
          trailing: Text(
            '${state.adjustedCalories} kcal',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: state.adjustmentDelta != 0
                  ? (state.adjustmentDelta > 0
                        ? context.nutriqColors.success
                        : context.nutriqColors.warning)
                  : null,
            ),
          ),
        ),
        if (state.adjustmentDelta != 0)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '${state.adjustmentDelta > 0 ? '+' : ''}${state.adjustmentDelta} kcal',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: state.adjustmentDelta > 0
                    ? context.nutriqColors.success
                    : context.nutriqColors.warning,
              ),
            ),
          ),
        const Divider(),
        ListTile(
          title: Text(l10n.lastAdjustment),
          subtitle: Text(
            state.lastAdjustmentDate != null
                ? '${state.lastAdjustmentDate!.day}.${state.lastAdjustmentDate!.month}.${state.lastAdjustmentDate!.year}'
                : '',
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        Text(
          l10n.exerciseCreditLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        RadioGroup<ExerciseCalorieModeEntity>(
          groupValue: state.exerciseCalorieMode,
          onChanged: (value) {
            if (value != null) {
              ref
                  .read(autopilotNotifierProvider.notifier)
                  .toggleExerciseCredit(value);
            }
          },
          child: Column(
            children: ExerciseCalorieModeEntity.values
                .map(
                  (mode) => RadioListTile<ExerciseCalorieModeEntity>(
                    title: Text(mode.getName(context)),
                    value: mode,
                  ),
                )
                .toList(),
          ),
        ),
        if (state.exerciseCalorieMode == ExerciseCalorieModeEntity.custom)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                    value: state.exerciseCreditPercent,
                    min: 0.0,
                    max: 1.0,
                    divisions: 20,
                    label: '${(state.exerciseCreditPercent * 100).round()}%',
                    onChanged: (value) {
                      ref
                          .read(autopilotNotifierProvider.notifier)
                          .setExerciseCreditPercent(value);
                    },
                  ),
                ),
                SizedBox(
                  width: 48,
                  child: Text(
                    '${(state.exerciseCreditPercent * 100).round()}%',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        const SizedBox(height: 24),
        FilledButton.icon(
          onPressed: state.isEnabled
              ? () {
                  ref
                      .read(autopilotNotifierProvider.notifier)
                      .recalculateBudget(0, state.baselineCalories);
                }
              : null,
          icon: const Icon(Icons.refresh),
          label: Text(l10n.recalculateBudget),
        ),
      ],
    );
  }
}
