import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:nutriq/features/body_measurements/presentation/body_measurement_bloc.dart';
import 'package:nutriq/features/body_measurements/presentation/widgets/measurement_history_list.dart';
import 'package:nutriq/features/body_measurements/presentation/widgets/measurement_trend_chart.dart';

class BodyMeasurementScreen extends ConsumerStatefulWidget {
  const BodyMeasurementScreen({super.key});

  @override
  ConsumerState<BodyMeasurementScreen> createState() => _BodyMeasurementScreenState();
}

class _BodyMeasurementScreenState extends ConsumerState<BodyMeasurementScreen> {
  late BodyMeasurementBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = ref.read(bodyMeasurementBlocProvider);
    final now = DateTime.now();
    _bloc.add(LoadMeasurements(
      startDate: DateTime(now.year, now.month, 1),
      endDate: DateTime(now.year, now.month + 1, 0),
    ));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(title: Text(s.bodyMeasurementTitle)),
        body: BlocBuilder<BodyMeasurementBloc, BodyMeasurementState>(
          builder: (context, state) {
            if (state is BodyMeasurementLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is BodyMeasurementError) {
              return Center(child: Text(state.message));
            }
            if (state is BodyMeasurementLoaded) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MeasurementTrendChart(measurements: state.measurements),
                    const SizedBox(height: 24),
                    MeasurementHistoryList(
                      measurements: state.measurements,
                      onDelete: (measurement) {
                        final now = DateTime.now();
                        _bloc.add(DeleteMeasurement(
                          measurement: measurement,
                          startDate: DateTime(now.year, now.month, 1),
                          endDate: DateTime(now.year, now.month + 1, 0),
                        ));
                      },
                    ),
                  ],
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddDialog(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<DateTime?> _pickDate(BuildContext context, DateTime selected) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selected,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    return picked;
  }

  void _showAddDialog(BuildContext context) {
    final s = S.of(context);
    final waistCtrl = TextEditingController();
    final neckCtrl = TextEditingController();
    final hipCtrl = TextEditingController();
    final chestCtrl = TextEditingController();
    final bicepCtrl = TextEditingController();
    final thighCtrl = TextEditingController();
    final noteCtrl = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(s.addMeasurement),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(s.date),
                  subtitle: Text(
                    '${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final picked = await _pickDate(context, selectedDate);
                    if (picked != null) {
                      setDialogState(() => selectedDate = picked);
                    }
                  },
                ),
                TextField(
                    controller: waistCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: s.waistCm)),
                TextField(
                    controller: neckCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: s.neckCm)),
                TextField(
                    controller: hipCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: s.hipCm)),
                TextField(
                    controller: chestCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: s.chestCm)),
                TextField(
                    controller: bicepCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: s.bicepCm)),
                TextField(
                    controller: thighCtrl,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: s.thighCm)),
                TextField(
                    controller: noteCtrl,
                    decoration: InputDecoration(labelText: s.note)),
              ],
            ),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx), child: Text(s.cancel)),
            TextButton(
              onPressed: () {
                final measurement = BodyMeasurementEntity(
                  id: 0,
                  userId: 0,
                  date: selectedDate,
                  waistCm: waistCtrl.text.isNotEmpty
                      ? double.tryParse(waistCtrl.text)
                      : null,
                  neckCm: neckCtrl.text.isNotEmpty
                      ? double.tryParse(neckCtrl.text)
                      : null,
                  hipCm: hipCtrl.text.isNotEmpty
                      ? double.tryParse(hipCtrl.text)
                      : null,
                  chestCm: chestCtrl.text.isNotEmpty
                      ? double.tryParse(chestCtrl.text)
                      : null,
                  bicepCm: bicepCtrl.text.isNotEmpty
                      ? double.tryParse(bicepCtrl.text)
                      : null,
                  thighCm: thighCtrl.text.isNotEmpty
                      ? double.tryParse(thighCtrl.text)
                      : null,
                  note: noteCtrl.text.isNotEmpty ? noteCtrl.text : null,
                );
                _bloc.add(AddMeasurement(
                  measurement: measurement,
                  startDate: DateTime(selectedDate.year, selectedDate.month, 1),
                  endDate:
                      DateTime(selectedDate.year, selectedDate.month + 1, 0),
                ));
                Navigator.pop(ctx);
              },
              child: Text(s.save),
            ),
          ],
        ),
      ),
    );
  }
}
