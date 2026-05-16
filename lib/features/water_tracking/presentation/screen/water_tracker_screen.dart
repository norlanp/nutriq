import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/water_tracking/presentation/water_bloc.dart';
import 'package:nutriq/features/water_tracking/presentation/widgets/water_progress_ring.dart';
import 'package:nutriq/features/water_tracking/presentation/widgets/water_entry_list.dart';
import 'package:nutriq/generated/l10n.dart';

class WaterTrackerScreen extends ConsumerStatefulWidget {
  const WaterTrackerScreen({super.key});

  @override
  ConsumerState<WaterTrackerScreen> createState() => _WaterTrackerScreenState();
}

class _WaterTrackerScreenState extends ConsumerState<WaterTrackerScreen> {
  late WaterBloc _waterBloc;
  static const int _defaultDailyGoal = 2000;

  @override
  void initState() {
    _waterBloc = ref.read(waterBlocProvider);
    _waterBloc
        .add(LoadWater(date: DateTime.now(), dailyGoal: _defaultDailyGoal));
    super.initState();
  }

  @override
  void dispose() {
    _waterBloc.close();
    super.dispose();
  }

  void _addWater(int amountMl) {
    final now = DateTime.now();
    final entry = WaterEntity(
      id: 0,
      userId: 0,
      amountMl: amountMl,
      date: DateTime(now.year, now.month, now.day),
      timestamp: now,
    );
    _waterBloc.add(
        AddWater(entry: entry, date: entry.date, dailyGoal: _defaultDailyGoal));
  }

  void _addCustomAmount() {
    final controller = TextEditingController(text: '250');
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).addWater),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: S.of(context).ml,
            suffixText: 'ml',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(S.of(context).dialogCancelLabel),
          ),
          TextButton(
            onPressed: () {
              final amount = int.tryParse(controller.text) ?? 0;
              if (amount > 0) {
                Navigator.of(ctx).pop();
                _addWater(amount);
              }
            },
            child: Text(S.of(context).addLabel),
          ),
        ],
      ),
    );
  }

  void _deleteEntry(WaterEntity entry) {
    _waterBloc.add(DeleteWater(
        entry: entry, date: entry.date, dailyGoal: _defaultDailyGoal));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _waterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).waterTrackerTitle),
        ),
        body: BlocBuilder<WaterBloc, WaterState>(
          bloc: _waterBloc,
          builder: (context, state) {
            if (state is WaterLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is WaterError) {
              return Center(child: Text(state.message));
            }
            if (state is WaterLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    WaterProgressRing(
                      current: state.dailyTotal,
                      goal: state.dailyGoal,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '${state.dailyTotal} / ${state.dailyGoal} ml',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: [
                        _QuickAddButton(
                          amount: 250,
                          label: '250 ml',
                          onTap: () => _addWater(250),
                        ),
                        _QuickAddButton(
                          amount: 500,
                          label: '500 ml',
                          onTap: () => _addWater(500),
                        ),
                        _QuickAddButton(
                          amount: 750,
                          label: '750 ml',
                          onTap: () => _addWater(750),
                        ),
                        _QuickAddButton(
                          amount: 0,
                          label: S.of(context).custom,
                          onTap: _addCustomAmount,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    WaterEntryList(
                      entries: state.entries,
                      onDelete: _deleteEntry,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

class _QuickAddButton extends StatelessWidget {
  final int amount;
  final String label;
  final VoidCallback onTap;

  const _QuickAddButton({
    required this.amount,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: const Icon(Icons.add),
      label: Text(label),
    );
  }
}
