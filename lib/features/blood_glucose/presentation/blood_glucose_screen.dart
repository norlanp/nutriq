import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/blood_glucose/presentation/blood_glucose_bloc.dart';
import 'package:nutriq/features/blood_glucose/presentation/widgets/bg_trend_chart.dart';
import 'package:nutriq/features/blood_glucose/presentation/widgets/bg_day_timeline.dart';
import 'package:nutriq/generated/l10n.dart';

class BloodGlucoseScreen extends ConsumerStatefulWidget {
  const BloodGlucoseScreen({super.key});

  @override
  ConsumerState<BloodGlucoseScreen> createState() => _BloodGlucoseScreenState();
}

class _BloodGlucoseScreenState extends ConsumerState<BloodGlucoseScreen> {
  late BloodGlucoseBloc _bloc;
  BloodGlucoseLabelType _selectedLabel = BloodGlucoseLabelType.fasting;
  final _valueController = TextEditingController();
  final _notesController = TextEditingController();

  @override
  void initState() {
    _bloc = ref.read(bloodGlucoseBlocProvider);
    _bloc.add(LoadBloodGlucoseEntries(date: DateTime.now()));
    super.initState();
  }

  @override
  void dispose() {
    _valueController.dispose();
    _notesController.dispose();
    _bloc.close();
    super.dispose();
  }

  Color _valueColor(int valueMgDl) {
    if (valueMgDl < 70) return Colors.red;
    if (valueMgDl <= 180) return Colors.green;
    return Colors.orange;
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
    _bloc.add(AddBloodGlucoseEntry(entry: entry, date: entry.date));
    _valueController.clear();
    _notesController.clear();
  }

  void _deleteEntry(BloodGlucoseEntity entry) {
    _bloc.add(DeleteBloodGlucoseEntry(
      entry: entry,
      date: entry.date,
    ));
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
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(s.bloodGlucoseTitle),
        ),
        body: BlocBuilder<BloodGlucoseBloc, BloodGlucoseState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is BloodGlucoseLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BloodGlucoseError) {
              return Center(child: Text(state.message));
            }
            final entries = state is BloodGlucoseLoaded
                ? state.entries
                : <BloodGlucoseEntity>[];
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Value input
                  TextField(
                    controller: _valueController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: s.bloodGlucoseValue,
                      suffixText: s.bloodGlucoseMgdL,
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Label picker
                  DropdownButtonFormField<BloodGlucoseLabelType>(
                    value: _selectedLabel,
                    decoration: InputDecoration(labelText: s.bloodGlucoseLabel),
                    items: BloodGlucoseLabelType.values
                        .map((label) => DropdownMenuItem(
                              value: label,
                              child: Text(_labelDisplayName(label)),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _selectedLabel = value);
                      }
                    },
                  ),
                  const SizedBox(height: 12),
                  // Notes
                  TextField(
                    controller: _notesController,
                    decoration: InputDecoration(
                      labelText: '${s.bloodGlucoseLabel} Notes',
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),
                  // Target range info card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text('< 70',
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(width: 12),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text('70-180',
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(width: 12),
                          Container(
                            width: 12,
                            height: 12,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text('> 180',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _addEntry,
                    child: Text(s.addBloodGlucoseEntry),
                  ),
                  const SizedBox(height: 24),
                  // Day timeline
                  if (entries.isNotEmpty) ...[
                    Text(s.bloodGlucoseTimeline,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    BgDayTimeline(entries: entries, valueColor: _valueColor),
                    const SizedBox(height: 24),
                  ],
                  // Trend chart
                  if (entries.isNotEmpty) ...[
                    Text(s.bloodGlucoseTrend,
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 8),
                    BgTrendChart(entries: entries),
                    const SizedBox(height: 24),
                  ],
                  // Entries list
                  if (entries.isNotEmpty)
                    ...entries.map((entry) => Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: _valueColor(entry.valueMgDl),
                              child: Text(
                                '${entry.valueMgDl}',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ),
                            title: Text(
                              '${entry.valueMgDl} ${s.bloodGlucoseMgdL}',
                            ),
                            subtitle: Text(
                              '${_labelDisplayName(entry.label)}${entry.notes != null ? ' — ${entry.notes}' : ''}',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete_outline, size: 20),
                              onPressed: () => _deleteEntry(entry),
                            ),
                          ),
                        )),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
