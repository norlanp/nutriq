import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/features/symptom_tracking/presentation/notifier/symptom_notifier.dart';
import 'package:nutriq/features/symptom_tracking/presentation/notifier/symptom_state.dart';
import 'package:nutriq/features/symptom_tracking/presentation/widgets/symptom_trend_chart.dart';
import 'package:nutriq/generated/l10n.dart';

class SymptomTrackingScreen extends ConsumerStatefulWidget {
  const SymptomTrackingScreen({super.key});

  @override
  ConsumerState<SymptomTrackingScreen> createState() =>
      _SymptomTrackingScreenState();
}

class _SymptomTrackingScreenState extends ConsumerState<SymptomTrackingScreen> {
  String _selectedType = '';
  double _severity = 3;
  final _notesController = TextEditingController();
  final DateTime _startDate = DateTime.now().subtract(const Duration(days: 30));
  final DateTime _endDate = DateTime.now();

  static const _symptomTypes = [
    'headache',
    'fatigue',
    'nausea',
    'dizziness',
    'bloating',
    'cramps',
    'anxiety',
    'insomnia',
    'other',
  ];

  @override
  void initState() {
    super.initState();
    ref.read(symptomNotifierProvider.notifier).loadSymptoms(_startDate, _endDate);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  void _addSymptom() {
    if (_selectedType.isEmpty) return;
    final now = DateTime.now();
    final symptom = SymptomEntity(
      id: 0,
      userId: 0,
      date: DateTime(now.year, now.month, now.day),
      timestamp: now,
      type: _selectedType,
      severity: _severity.round(),
      notes: _notesController.text.isEmpty ? null : _notesController.text,
    );
    ref.read(symptomNotifierProvider.notifier).addSymptom(
          symptom,
          _startDate,
          _endDate,
        );
    setState(() {
      _selectedType = '';
      _severity = 3;
      _notesController.clear();
    });
  }

  void _deleteSymptom(SymptomEntity symptom) {
    ref.read(symptomNotifierProvider.notifier).deleteSymptom(
          symptom,
          _startDate,
          _endDate,
        );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(symptomNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.symptomTitle)),
      body: _buildBody(context, l10n, state),
    );
  }

  Widget _buildBody(BuildContext context, S l10n, SymptomState state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.symptomType, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _symptomTypes.map((type) {
              final isSelected = _selectedType == type;
              return ChoiceChip(
                label: Text(_localizeType(type, l10n)),
                selected: isSelected,
                onSelected: (selected) {
                  setState(() {
                    _selectedType = selected ? type : '';
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Text('${l10n.symptomSeverity}: ${_severity.round()}',
              style: Theme.of(context).textTheme.titleMedium),
          Slider(
            value: _severity,
            min: 1,
            max: 5,
            divisions: 4,
            label: _severity.round().toString(),
            onChanged: (value) {
              setState(() {
                _severity = value;
              });
            },
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _notesController,
            decoration: InputDecoration(
              labelText: l10n.symptomNotes,
              border: const OutlineInputBorder(),
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _selectedType.isEmpty ? null : _addSymptom,
              child: Text(l10n.addSymptom),
            ),
          ),
          const SizedBox(height: 24),
          Text(l10n.symptomTrend, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (state.symptoms.isNotEmpty)
            SymptomTrendChart(symptoms: state.symptoms)
          else
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Center(child: Text(l10n.noSymptomData)),
              ),
            ),
          const SizedBox(height: 24),
          Text(l10n.symptomHistory,
              style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          if (state.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (state.hasError)
            Center(child: Text(state.errorMessage!))
          else
            ...state.symptoms.reversed.map((s) => Card(
                  child: ListTile(
                    title: Text(_localizeType(s.type, l10n)),
                    subtitle: Text(
                      '${s.date.day}.${s.date.month}.${s.date.year} — ${l10n.symptomSeverity}: ${s.severity}${s.notes != null && s.notes!.isNotEmpty ? '\n${s.notes}' : ''}',
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => _deleteSymptom(s),
                    ),
                  ),
                )),
        ],
      ),
    );
  }

  String _localizeType(String type, S l10n) {
    switch (type) {
      case 'headache':
        return l10n.symptomTypeHeadache;
      case 'fatigue':
        return l10n.symptomTypeFatigue;
      case 'nausea':
        return l10n.symptomTypeNausea;
      case 'dizziness':
        return l10n.symptomTypeDizziness;
      case 'bloating':
        return l10n.symptomTypeBloating;
      case 'cramps':
        return l10n.symptomTypeCramps;
      case 'anxiety':
        return l10n.symptomTypeAnxiety;
      case 'insomnia':
        return l10n.symptomTypeInsomnia;
      default:
        return l10n.symptomTypeOther;
    }
  }
}