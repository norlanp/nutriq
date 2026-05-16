import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/medication/presentation/medication_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class MedicationScreen extends ConsumerStatefulWidget {
  const MedicationScreen({super.key});

  @override
  ConsumerState<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends ConsumerState<MedicationScreen> {
  late MedicationBloc _bloc;

  @override
  void initState() {
    _bloc = ref.read(medicationBlocProvider);
    _bloc.add(const LoadMedications(userId: 0));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _showAddMedicationDialog() {
    final nameController = TextEditingController();
    final dosageController = TextEditingController();
    final notesController = TextEditingController();
    var frequency = MedicationFrequencyType.daily;
    var timesPerDay = 1;

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setDialogState) => AlertDialog(
          title: Text(S.of(context).addMedication),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: S.of(context).medicationName,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: dosageController,
                  decoration: InputDecoration(
                    labelText: S.of(context).medicationDosage,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<MedicationFrequencyType>(
                  value: frequency,
                  decoration: InputDecoration(
                    labelText: S.of(context).medicationFrequency,
                  ),
                  items: MedicationFrequencyType.values
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(_frequencyLabel(e)),
                          ))
                      .toList(),
                  onChanged: (v) =>
                      setDialogState(() => frequency = v ?? frequency),
                ),
                const SizedBox(height: 8),
                if (frequency == MedicationFrequencyType.daily)
                  Row(
                    children: [
                      Text(S.of(context).timesPerDay),
                      const SizedBox(width: 8),
                      DropdownButton<int>(
                        value: timesPerDay,
                        items: List.generate(
                            10,
                            (i) => DropdownMenuItem(
                                value: i + 1, child: Text('${i + 1}'))),
                        onChanged: (v) =>
                            setDialogState(() => timesPerDay = v ?? 1),
                      ),
                    ],
                  ),
                const SizedBox(height: 8),
                TextField(
                  controller: notesController,
                  decoration: InputDecoration(
                    labelText: S.of(context).notes,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(S.of(context).dialogCancelLabel),
            ),
            TextButton(
              onPressed: () {
                if (nameController.text.isEmpty) return;
                final medication = MedicationEntity(
                  id: 0,
                  userId: 0,
                  name: nameController.text,
                  dosage: dosageController.text,
                  frequency: frequency,
                  timesPerDay: timesPerDay,
                  notes: notesController.text.isEmpty
                      ? null
                      : notesController.text,
                );
                _bloc.add(AddMedication(medication: medication, userId: 0));
                Navigator.of(ctx).pop();
              },
              child: Text(S.of(context).addLabel),
            ),
          ],
        ),
      ),
    );
  }

  String _frequencyLabel(MedicationFrequencyType type) {
    switch (type) {
      case MedicationFrequencyType.daily:
        return S.of(context).daily;
      case MedicationFrequencyType.weekly:
        return S.of(context).weekly;
      case MedicationFrequencyType.asNeeded:
        return S.of(context).asNeeded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).medicationTitle),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showAddMedicationDialog,
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<MedicationBloc, MedicationState>(
          bloc: _bloc,
          builder: (context, state) {
            if (state is MedicationLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is MedicationError) {
              return Center(child: Text(state.message));
            }
            if (state is MedicationsLoaded) {
              final medications = state.medications;
              if (medications.isEmpty) {
                return Center(
                  child: Text(S.of(context).noMedicationsAdded),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: medications.length,
                itemBuilder: (context, index) {
                  final med = medications[index];
                  return Card(
                    child: ListTile(
                      title: Text(med.name),
                      subtitle: Text(
                        '${med.dosage} · ${_frequencyLabel(med.frequency)}'
                        '${med.timesPerDay > 1 ? ' · ${med.timesPerDay}x/${S.of(context).daily.toLowerCase()}' : ''}',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline),
                        onPressed: () => _bloc.add(
                          DeleteMedication(
                            medicationId: med.id,
                            userId: med.userId,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
