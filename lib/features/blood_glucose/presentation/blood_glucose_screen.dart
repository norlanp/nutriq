import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/features/blood_glucose/presentation/notifier/blood_glucose_notifier.dart';
import 'package:nutriq/features/blood_glucose/presentation/notifier/blood_glucose_state.dart';
import 'package:nutriq/features/blood_glucose/presentation/widgets/bg_day_timeline.dart';
import 'package:nutriq/features/blood_glucose/presentation/widgets/bg_trend_chart.dart';
import 'package:nutriq/generated/l10n.dart';

class BloodGlucoseScreen extends ConsumerStatefulWidget {
  const BloodGlucoseScreen({super.key});

  @override
  ConsumerState<BloodGlucoseScreen> createState() => _BloodGlucoseScreenState();
}

class _BloodGlucoseScreenState extends ConsumerState<BloodGlucoseScreen> {
  BloodGlucoseLabelType _selectedLabel = BloodGlucoseLabelType.fasting;
  final _valueController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ref.read(bloodGlucoseNotifierProvider.notifier).loadEntries(DateTime.now());
  }

  @override
  void dispose() {
    _valueController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Color _valueColor(int valueMgDl) {
    final nc = context.nutriqColors;
    if (valueMgDl < 70) return Theme.of(context).colorScheme.error;
    if (valueMgDl <= 180) return nc.success;
    return nc.warning;
  }

  void _addEntry() {
    final value = int.tryParse(_valueController.text);
    if (value == null || value <= 0) return;
    final now = DateTime.now();
    final entry = BloodGlucoseEntity(
      id: 0,
      userId: 0,
      date: DateTime(now.year, now.month, now.day),
      timestamp: now,
      valueMgDl: value,
      label: _selectedLabel,
      notes: _notesController.text.isEmpty ? null : _notesController.text,
    );
    ref.read(bloodGlucoseNotifierProvider.notifier).addEntry(entry, entry.date);
    _valueController.clear();
    _notesController.clear();
  }

  void _deleteEntry(BloodGlucoseEntity entry) {
    ref
        .read(bloodGlucoseNotifierProvider.notifier)
        .deleteEntry(entry, entry.date);
  }

  String _labelDisplayName(BloodGlucoseLabelType label) {
    final s = S.of(context);
    switch (label) {
      case BloodGlucoseLabelType.fasting:
        return s.fasting;
      case BloodGlucoseLabelType.beforeMeal:
        return s.beforeMeal;
      case BloodGlucoseLabelType.afterMeal:
        return s.afterMeal;
      case BloodGlucoseLabelType.bedtime:
        return s.bedtime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final state = ref.watch(bloodGlucoseNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(s.bloodGlucoseTitle)),
      body: _buildBody(context, s, state),
    );
  }

  Widget _buildBody(BuildContext context, S s, BloodGlucoseState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _valueController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: s.bloodGlucoseValue,
              suffixText: s.bloodGlucoseMgdL,
            ),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<BloodGlucoseLabelType>(
            initialValue: _selectedLabel,
            decoration: InputDecoration(labelText: s.bloodGlucoseLabel),
            items: BloodGlucoseLabelType.values
                .map(
                  (label) => DropdownMenuItem(
                    value: label,
                    child: Text(_labelDisplayName(label)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedLabel = value);
              }
            },
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(
              labelText: '${s.bloodGlucoseLabel} Notes',
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Builder(
                builder: (context) {
                  final nc = context.nutriqColors;
                  final errorColor = Theme.of(context).colorScheme.error;
                  return Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: errorColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '< 70',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: nc.success,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '70-180',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 12),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: nc.warning,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '> 180',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _addEntry,
            child: Text(s.addBloodGlucoseEntry),
          ),
          const SizedBox(height: 24),
          if (state.entries.isNotEmpty) ...[
            Text(
              s.bloodGlucoseTimeline,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            BgDayTimeline(entries: state.entries, valueColor: _valueColor),
            const SizedBox(height: 24),
          ],
          if (state.entries.isNotEmpty) ...[
            Text(
              s.bloodGlucoseTrend,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            BgTrendChart(entries: state.entries),
            const SizedBox(height: 24),
          ],
          if (state.entries.isNotEmpty)
            ...state.entries.map(
              (entry) => Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: _valueColor(entry.valueMgDl),
                    child: Text(
                      '${entry.valueMgDl}',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  title: Text('${entry.valueMgDl} ${s.bloodGlucoseMgdL}'),
                  subtitle: Text(
                    '${_labelDisplayName(entry.label)}${entry.notes != null ? ' — ${entry.notes}' : ''}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete_outline, size: 20),
                    onPressed: () => _deleteEntry(entry),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
