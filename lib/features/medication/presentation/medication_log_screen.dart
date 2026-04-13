import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/medication/presentation/medication_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class MedicationLogScreen extends StatefulWidget {
  const MedicationLogScreen({super.key});

  @override
  State<MedicationLogScreen> createState() => _MedicationLogScreenState();
}

class _MedicationLogScreenState extends State<MedicationLogScreen> {
  late MedicationBloc _bloc;

  @override
  void initState() {
    _bloc = locator<MedicationBloc>();
    _bloc.add(LoadLog(date: DateTime.now()));
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
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
    _bloc.add(LogDose(log: updated, date: DateTime.now()));
  }

  void _addLogEntry(int medicationId, bool taken) {
    final now = DateTime.now();
    final log = MedicationLogEntity(
      id: 0,
      userId: 0,
      medicationId: medicationId,
      date: DateTime(now.year, now.month, now.day),
      timestamp: now,
      doseTaken: taken,
    );
    _bloc.add(LogDose(log: log, date: now));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).medicationLog),
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
            if (state is MedicationLogLoaded) {
              final logs = state.logs;
              if (logs.isEmpty) {
                return Center(
                  child: Text(S.of(context).noLogsToday),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: logs.length,
                itemBuilder: (context, index) {
                  final log = logs[index];
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
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
