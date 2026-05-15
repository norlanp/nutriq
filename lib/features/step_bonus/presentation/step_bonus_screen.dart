import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/step_bonus/presentation/step_bonus_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class StepBonusScreen extends StatefulWidget {
  const StepBonusScreen({super.key});

  @override
  State<StepBonusScreen> createState() => _StepBonusScreenState();
}

class _StepBonusScreenState extends State<StepBonusScreen> {
  late StepBonusBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = locator<StepBonusBloc>();
    _bloc.add(const LoadStepBonusConfig());
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
        title: Text(l10n.stepBonusLabel),
      ),
      body: BlocBuilder<StepBonusBloc, StepBonusState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is StepBonusLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is StepBonusError) {
            return Center(child: Text(state.message));
          }
          if (state is StepBonusLoaded) {
            return _buildContent(context, l10n, state);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, S l10n, StepBonusLoaded state) {
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
            _bloc.add(ToggleStepBonus(enabled: value));
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
                    ? (v) => _bloc.add(SetStepBonusPercent(percent: v))
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
                      ? () => _bloc.add(const RefreshStepCredit())
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
