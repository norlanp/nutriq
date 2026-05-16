import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/health_sync/presentation/notifier/health_sync_notifier.dart';
import 'package:nutriq/features/health_sync/presentation/notifier/health_sync_state.dart';
import 'package:nutriq/generated/l10n.dart';

class HealthSyncScreen extends ConsumerStatefulWidget {
  const HealthSyncScreen({super.key});

  @override
  ConsumerState<HealthSyncScreen> createState() => _HealthSyncScreenState();
}

class _HealthSyncScreenState extends ConsumerState<HealthSyncScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);
    final state = ref.watch(healthSyncNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.healthSyncTitle),
      ),
      body: switch (state) {
        _ when state.isLoading && !state.isAuthorized =>
          const Center(child: CircularProgressIndicator()),
        _ when state.hasError && !state.isAuthorized =>
          _ErrorView(message: state.errorMessage!),
        _ when !state.isAuthorized =>
          _PermissionRequest(l10n: l10n),
        _ =>
          _HealthSyncForm(
            state: state,
            l10n: l10n,
          ),
      },
    );
  }
}

class _PermissionRequest extends ConsumerWidget {
  final S l10n;

  const _PermissionRequest({required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                l10n.healthSyncPermissionRequired,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 12),
              FilledButton(
                onPressed: () {
                  ref
                      .read(healthSyncNotifierProvider.notifier)
                      .requestPermissions();
                },
                child: Text(l10n.healthSyncGrantPermission),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(message, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}

class _HealthSyncForm extends ConsumerWidget {
  final HealthSyncState state;
  final S l10n;

  const _HealthSyncForm({required this.state, required this.l10n});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Text(
          l10n.healthSyncDataTypes,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 8.0),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: const Icon(Icons.directions_walk_outlined),
          title: Text(l10n.healthSyncSteps),
          value: state.stepsEnabled,
          onChanged: (enabled) {
            ref
                .read(healthSyncNotifierProvider.notifier)
                .toggleStepsSync(enabled);
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: const Icon(Icons.fitness_center_outlined),
          title: Text(l10n.healthSyncWorkouts),
          value: state.workoutsEnabled,
          onChanged: (enabled) {
            ref
                .read(healthSyncNotifierProvider.notifier)
                .toggleWorkoutsSync(enabled);
          },
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          secondary: const Icon(Icons.monitor_weight_outlined),
          title: Text(l10n.healthSyncWeight),
          value: state.weightEnabled,
          onChanged: (enabled) {
            ref
                .read(healthSyncNotifierProvider.notifier)
                .toggleWeightSync(enabled);
          },
        ),
        const SizedBox(height: 24.0),
        if (state.lastSyncTimestamp != null)
          Text(
            l10n.healthSyncLastSync(
              _formatTimestamp(state.lastSyncTimestamp!),
            ),
            style: Theme.of(context).textTheme.bodySmall,
          )
        else
          Text(
            l10n.healthSyncNeverSynced,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        const SizedBox(height: 16.0),
        if (state.isLoading)
          const Center(child: CircularProgressIndicator())
        else
          FilledButton(
            onPressed: () {
              ref.read(healthSyncNotifierProvider.notifier).syncAll();
            },
            child: Text(l10n.healthSyncNow),
          ),
        if (state.syncedSteps != null) ...[
          const SizedBox(height: 16.0),
          Text(
            l10n.healthSyncStepsResult(state.syncedSteps!),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
        if (state.hasError) ...[
          const SizedBox(height: 8.0),
          Text(
            state.errorMessage!,
            style: TextStyle(color: Theme.of(context).colorScheme.error),
          ),
        ],
      ],
    );
  }

  String _formatTimestamp(DateTime timestamp) {
    return '${timestamp.day.toString().padLeft(2, '0')}.'
        '${timestamp.month.toString().padLeft(2, '0')}.'
        '${timestamp.year} '
        '${timestamp.hour.toString().padLeft(2, '0')}:'
        '${timestamp.minute.toString().padLeft(2, '0')}';
  }
}