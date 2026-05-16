import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/exercise_calorie_mode_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/autopilot/presentation/autopilot_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class AutopilotScreen extends ConsumerStatefulWidget {
  const AutopilotScreen({super.key});

  @override
  ConsumerState<AutopilotScreen> createState() => _AutopilotScreenState();
}

class _AutopilotScreenState extends ConsumerState<AutopilotScreen> {
  late AutopilotBloc _bloc;

  @override
  void initState() {
    _bloc = ref.read(autopilotBlocProvider);
    _bloc.add(const LoadAutopilotStatus(userId: 0));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.autopilotLabel),
      ),
      body: BlocBuilder<AutopilotBloc, AutopilotState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is AutopilotLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AutopilotError) {
            return Center(child: Text(state.message));
          }
          if (state is AutopilotLoaded) {
            return _buildContent(context, state, l10n);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    AutopilotLoaded state,
    S l10n,
  ) {
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
            _bloc.add(ToggleAutopilot(
              userId: 0,
              enabled: value,
              baselineCalories: state.baselineCalories,
            ));
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
                          ? Colors.green
                          : Colors.orange)
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
                        ? Colors.green
                        : Colors.orange,
                  ),
            ),
          ),
        const Divider(),
        ListTile(
          title: Text(l10n.lastAdjustment),
          subtitle: Text(
            '${state.lastAdjustmentDate.day}.${state.lastAdjustmentDate.month}.${state.lastAdjustmentDate.year}',
          ),
        ),
        const SizedBox(height: 16),
        const Divider(),
        Text(
          l10n.exerciseCreditLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...ExerciseCalorieModeEntity.values.map(
          (mode) => RadioListTile<ExerciseCalorieModeEntity>(
            title: Text(mode.getName(context)),
            value: mode,
            groupValue: state.exerciseCalorieMode,
            onChanged: (value) {
              if (value != null) {
                _bloc.add(ToggleExerciseCredit(mode: value));
              }
            },
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
                      _bloc.add(SetExerciseCreditPercent(percent: value));
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
                  _bloc.add(RecalculateBudget(
                    userId: 0,
                    baselineCalories: state.baselineCalories,
                  ));
                }
              : null,
          icon: const Icon(Icons.refresh),
          label: Text(l10n.recalculateBudget),
        ),
      ],
    );
  }
}
