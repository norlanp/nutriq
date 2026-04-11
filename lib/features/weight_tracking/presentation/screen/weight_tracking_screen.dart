import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/weight_tracking/presentation/bloc/weight_bloc.dart';
import 'package:nutriq/features/weight_tracking/presentation/widgets/bmi_display.dart';
import 'package:nutriq/features/weight_tracking/presentation/widgets/goal_progress_widget.dart';
import 'package:nutriq/features/weight_tracking/presentation/widgets/weight_trend_chart.dart';
import 'package:nutriq/generated/l10n.dart';

class WeightTrackingScreen extends StatefulWidget {
  const WeightTrackingScreen({super.key});

  @override
  State<WeightTrackingScreen> createState() => _WeightTrackingScreenState();
}

class _WeightTrackingScreenState extends State<WeightTrackingScreen> {
  late WeightBloc _weightBloc;
  final _weightController = TextEditingController();
  final _noteController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    _weightBloc = locator<WeightBloc>();
    _weightBloc.add(const LoadWeights());
    super.initState();
  }

  @override
  void dispose() {
    _weightController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).weightTracking)),
      body: BlocBuilder<WeightBloc, WeightState>(
        bloc: _weightBloc,
        builder: (context, state) {
          if (state is WeightsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WeightError) {
            return Center(child: Text(state.message));
          }
          if (state is WeightsLoaded) {
            return ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                _buildInputForm(context, state),
                const SizedBox(height: 16.0),
                if (state.latestWeight != null) ...[
                  BMIDisplay(latestWeightKg: state.latestWeight!.weightKg),
                  const SizedBox(height: 16.0),
                ],
                const GoalProgressWidget(),
                const SizedBox(height: 16.0),
                if (state.weights.length >= 2) ...[
                  WeightTrendChart(weights: state.weights),
                  const SizedBox(height: 16.0),
                ],
                Text(
                  S.of(context).weightTrend,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8.0),
                if (state.weights.isEmpty)
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Text(
                        S.of(context).noWeightEntries,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.7)),
                      ),
                    ),
                  )
                else
                  ...state.weights.map((w) => _WeightListTile(
                        weight: w,
                        onDelete: () => _weightBloc.add(DeleteWeight(w)),
                      )),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildInputForm(BuildContext context, WeightsLoaded state) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              S.of(context).logWeight,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _weightController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: S.of(context).weightKg,
                border: const OutlineInputBorder(),
                suffixText: 'kg',
              ),
            ),
            const SizedBox(height: 12.0),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(S.of(context).date),
              subtitle: Text(_formatDate(_selectedDate)),
              trailing: const Icon(Icons.calendar_today),
              onTap: _pickDate,
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(
                labelText: S.of(context).note,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            FilledButton(
              onPressed: _saveWeight,
              child: Text(S.of(context).save),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _saveWeight() {
    final weightValue = double.tryParse(_weightController.text);
    if (weightValue == null || weightValue <= 0) return;

    final weight = WeightEntity(
      id: DateTime.now().millisecondsSinceEpoch,
      userId: 0,
      weightKg: weightValue,
      date: _selectedDate,
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
    );

    _weightBloc.add(AddWeight(weight));
    _weightController.clear();
    _noteController.clear();
    setState(() => _selectedDate = DateTime.now());
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }
}

class _WeightListTile extends StatelessWidget {
  final WeightEntity weight;
  final VoidCallback onDelete;

  const _WeightListTile({required this.weight, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(weight.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => onDelete(),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16.0),
        color: Theme.of(context).colorScheme.error,
        child: Icon(Icons.delete, color: Theme.of(context).colorScheme.onError),
      ),
      child: ListTile(
        leading: const Icon(Icons.monitor_weight_outlined),
        title: Text('${weight.weightKg.toStringAsFixed(1)} kg'),
        subtitle: Text(_formatDate(weight.date) +
            (weight.note != null ? ' — ${weight.note}' : '')),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () => _confirmDelete(context),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}';
  }

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(S.of(context).deleteWeight),
        content: Text(S.of(context).deleteTimeDialogContent),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(S.of(context).dialogCancelLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              onDelete();
            },
            child: Text(S.of(context).dialogDeleteLabel),
          ),
        ],
      ),
    );
  }
}
