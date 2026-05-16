import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/medication/presentation/notifier/medication_notifier.dart';

import 'package:nutriq/generated/l10n.dart';

class MedicationSummaryWidget extends ConsumerStatefulWidget {
  const MedicationSummaryWidget({super.key});

  @override
  ConsumerState<MedicationSummaryWidget> createState() =>
      _MedicationSummaryWidgetState();
}

class _MedicationSummaryWidgetState extends ConsumerState<MedicationSummaryWidget> {
  @override
  void initState() {
    super.initState();
    final notifier = ref.read(medicationNotifierProvider.notifier);
    notifier.loadMedications(0);
    notifier.loadLog(DateTime.now());
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
    ref.read(medicationNotifierProvider.notifier).logDose(log, now);
  }

  void _navigateToMedication() async {
    await context.push(AppRoutes.medication);
    if (mounted) {
      final notifier = ref.read(medicationNotifierProvider.notifier);
      notifier.loadMedications(0);
      notifier.loadLog(DateTime.now());
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(medicationNotifierProvider);

    if (state.medications.isEmpty && !state.isLoading) {
      return const SizedBox.shrink();
    }

    return _MedicationSummaryContent(
      medications: state.medications,
      logs: state.logs,
      onToggleDose: _toggleDose,
      onAddLogEntry: _addLogEntry,
      onTap: _navigateToMedication,
    );
  }
}

class _MedicationSummaryContent extends StatelessWidget {
  final List<MedicationEntity> medications;
  final List<MedicationLogEntity> logs;
  final void Function(MedicationLogEntity, bool) onToggleDose;
  final void Function(int, bool) onAddLogEntry;
  final VoidCallback onTap;

  const _MedicationSummaryContent({
    required this.medications,
    required this.logs,
    required this.onToggleDose,
    required this.onAddLogEntry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final takenCount = logs.where((l) => l.doseTaken).length;
    final totalCount =
        medications.fold<int>(0, (sum, m) => sum + m.timesPerDay);
    final percent =
        totalCount > 0 ? (takenCount / totalCount).clamp(0.0, 1.0) : 0.0;

    return Card(
      elevation: 1,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: CircularProgressIndicator(
                          value: percent,
                          strokeWidth: 6,
                          backgroundColor: theme.colorScheme.primaryContainer
                              .withValues(alpha: 0.3),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            theme.colorScheme.primary,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.medication,
                        size: 28,
                        color: theme.colorScheme.primary,
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).medicationSummaryTitle,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          S
                              .of(context)
                              .medicationProgress('$takenCount', '$totalCount'),
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ...medications.map((med) => _MedicationTile(
                    medication: med,
                    logs: logs,
                    onToggleDose: onToggleDose,
                    onAddLogEntry: onAddLogEntry,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class _MedicationTile extends StatelessWidget {
  final MedicationEntity medication;
  final List<MedicationLogEntity> logs;
  final void Function(MedicationLogEntity, bool) onToggleDose;
  final void Function(int, bool) onAddLogEntry;

  const _MedicationTile({
    required this.medication,
    required this.logs,
    required this.onToggleDose,
    required this.onAddLogEntry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final medLogs = logs.where((l) => l.medicationId == medication.id).toList();
    final takenCount = medLogs.where((l) => l.doseTaken).length;
    final totalDoses = medication.timesPerDay;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  medication.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  medication.dosage,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          ...List.generate(totalDoses, (index) {
            final doseIndex = index;
            final existingLog =
                medLogs.length > doseIndex ? medLogs[doseIndex] : null;
            final isTaken = doseIndex < takenCount;

            return Padding(
              padding: const EdgeInsets.only(left: 4),
              child: InkWell(
                onTap: () {
                  if (existingLog != null) {
                    onToggleDose(existingLog, !existingLog.doseTaken);
                  } else {
                    onAddLogEntry(medication.id, true);
                  }
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isTaken
                        ? theme.colorScheme.primary
                        : theme.colorScheme.surfaceContainerHighest,
                    border: Border.all(
                      color: isTaken
                          ? theme.colorScheme.primary
                          : theme.colorScheme.outline.withValues(alpha: 0.5),
                    ),
                  ),
                  child: isTaken
                      ? Icon(
                          Icons.check,
                          size: 18,
                          color: theme.colorScheme.onPrimary,
                        )
                      : null,
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}