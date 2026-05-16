import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/calorie_cycling/presentation/calorie_cycling_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class CalorieCyclingScreen extends ConsumerStatefulWidget {
  const CalorieCyclingScreen({super.key, this.globalCalorieBudget});

  final double? globalCalorieBudget;

  @override
  ConsumerState<CalorieCyclingScreen> createState() => _CalorieCyclingScreenState();
}

class _CalorieCyclingScreenState extends ConsumerState<CalorieCyclingScreen> {
  late CalorieCyclingBloc _bloc;
  final _weekdayLabels = <int, String>{};
  late Map<int, double> _weekdayTargets;
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    _bloc = ref.read(calorieCyclingBlocProvider);
    _weekdayTargets = {};
    _bloc.add(const LoadCycle());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  String _getWeekdayLabel(int weekday, S l10n) {
    switch (weekday) {
      case 1:
        return l10n.mondayLabel;
      case 2:
        return l10n.tuesdayLabel;
      case 3:
        return l10n.wednesdayLabel;
      case 4:
        return l10n.thursdayLabel;
      case 5:
        return l10n.fridayLabel;
      case 6:
        return l10n.saturdayLabel;
      case 7:
        return l10n.sundayLabel;
      default:
        return '';
    }
  }

  void _initWeekdayLabels(S l10n) {
    for (int i = 1; i <= 7; i++) {
      _weekdayLabels[i] = _getWeekdayLabel(i, l10n);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    _initWeekdayLabels(l10n);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.calorieCyclingLabel),
      ),
      body: BlocBuilder<CalorieCyclingBloc, CalorieCyclingState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is CalorieCyclingLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CalorieCyclingError) {
            return Center(child: Text(state.message));
          }
          if (state is CalorieCyclingLoaded) {
            _isEnabled = state.isEnabled;
            _weekdayTargets = Map.from(state.weekdayCalorieMap);
            if (_weekdayTargets.isEmpty && widget.globalCalorieBudget != null) {
              for (int i = 1; i <= 7; i++) {
                _weekdayTargets[i] = widget.globalCalorieBudget!;
              }
            }
            return _buildContent(context, l10n);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, S l10n) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(
          l10n.calorieCyclingDescription,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(height: 24),
        SwitchListTile(
          title: Text(l10n.enableCalorieCycling),
          value: _isEnabled,
          onChanged: (value) {
            _bloc.add(ToggleCycling(enabled: value));
          },
        ),
        const Divider(),
        if (widget.globalCalorieBudget != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.globalCalorieBudget,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Text(
                  '${widget.globalCalorieBudget!.round()} kcal',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
        const Divider(),
        Text(
          l10n.weekdayTargets,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8),
        ...List.generate(7, (index) {
          final weekday = index + 1;
          final target =
              _weekdayTargets[weekday] ?? widget.globalCalorieBudget ?? 2000;
          return _WeekdayRow(
            label: _weekdayLabels[weekday] ?? '',
            target: target,
            isEnabled: _isEnabled,
            onChanged: (value) {
              _weekdayTargets[weekday] = value;
              _bloc
                  .add(SaveCycle(weekdayCalorieMap: Map.from(_weekdayTargets)));
            },
          );
        }),
      ],
    );
  }
}

class _WeekdayRow extends StatelessWidget {
  const _WeekdayRow({
    required this.label,
    required this.target,
    required this.isEnabled,
    required this.onChanged,
  });

  final String label;
  final double target;
  final bool isEnabled;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isEnabled ? null : Theme.of(context).disabledColor,
                  ),
            ),
          ),
          Expanded(
            child: Slider(
              value: target.clamp(500, 5000),
              min: 500,
              max: 5000,
              divisions: 90,
              label: target.round().toString(),
              onChanged: isEnabled ? (v) => onChanged(v) : null,
            ),
          ),
          SizedBox(
            width: 72,
            child: Text(
              '${target.round()} kcal',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isEnabled ? null : Theme.of(context).disabledColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
