import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/features/medication/presentation/notifier/medication_notifier.dart';
import 'package:nutriq/features/medication/presentation/notifier/medication_state.dart';
import 'package:nutriq/generated/l10n.dart';

class MedicationLogScreen extends ConsumerStatefulWidget {
  const MedicationLogScreen({super.key});

  @override
  ConsumerState<MedicationLogScreen> createState() =>
      _MedicationLogScreenState();
}

class _MedicationLogScreenState extends ConsumerState<MedicationLogScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(medicationNotifierProvider.notifier).loadLog(DateTime.now());
  }

  void _toggleDose(MedicationLogEntity existing, bool taken) {
    final updated = MedicationLogEntity(
      id: existing.id,
      userId: existing.userId,
      medicationId: existing.medicationId,
      date: existing.date,
      timestamp: existing.timestamp,
      doseTaken: taken,
      notes: existing.notes,
    );
    ref.read(medicationNotifierProvider.notifier).logDose(updated, DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(medicationNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).medicationLog)),
      body: _buildBody(context, state),
    );
  }

  Widget _buildBody(BuildContext context, MedicationState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(child: Text(state.errorMessage!));
    }
    if (state.logs.isEmpty) {
      return Center(child: Text(S.of(context).noLogsToday));
    }
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: state.logs.length,
      itemBuilder: (context, index) {
        final log = state.logs[index];
        return Card(
          child: CheckboxListTile(
            value: log.doseTaken,
            title: Text(
              log.doseTaken
                  ? S.of(context).doseTaken
                  : S.of(context).doseMissed,
            ),
            subtitle: Text(
              '${log.timestamp.hour}:${log.timestamp.minute.toString().padLeft(2, '0')}',
            ),
            onChanged: (v) => _toggleDose(log, v ?? false),
          ),
        );
      },
    );
  }
}