import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/step_bonus/presentation/notifier/step_bonus_notifier.dart';
import 'package:nutriq/features/step_bonus/presentation/notifier/step_bonus_state.dart';
import 'package:nutriq/generated/l10n.dart';

class StepBonusScreen extends ConsumerStatefulWidget {
  const StepBonusScreen({super.key});

  @override
  ConsumerState<StepBonusScreen> createState() => _StepBonusScreenState();
}

class _StepBonusScreenState extends ConsumerState<StepBonusScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(stepBonusNotifierProvider.notifier).loadConfig();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(stepBonusNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.stepBonusLabel),
      ),
      body: _buildBody(context, l10n, state),
    );
  }

  Widget _buildBody(BuildContext context, S l10n, StepBonusState state) {
    if (state.isLoading && !state.isLoaded) {
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

  Widget _buildContent(BuildContext context, S l10n, StepBonusState state) {
    final notifier = ref.read(stepBonusNotifierProvider.notifier);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.stepBonusDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        SwitchListTile(
          title: Text(l10n.stepBonusEnableLabel),
          value: state.isEnabled,
          onChanged: (value) {
            notifier.toggleBonus(value);
          },
        ),
        const Divider(),
        Opacity(
          opacity: state.isEnabled ? 1.0 : 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.stepBonusPercentLabel,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '${(state.percent * 100).round()}%',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Slider(
                value: state.percent,
                min: 0.0,
                max: 1.0,
                divisions: 20,
                label: '${(state.percent * 100).round()}%',
                onChanged: state.isEnabled
                    ? (v) => notifier.setPercent(v)
                    : null,
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.stepBonusTodaySummary,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.stepBonusStepsLabel),
                          Text(
                            '${state.todaySteps}',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.stepBonusCreditLabel),
                          Text(
                            '${state.calorieCredit.round()} kcal',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: state.isEnabled
                      ? () => notifier.refreshCredit()
                      : null,
                  child: Text(l10n.stepBonusRefreshLabel),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}