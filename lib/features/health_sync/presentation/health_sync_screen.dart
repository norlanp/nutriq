import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/health_sync/presentation/health_sync_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class HealthSyncScreen extends ConsumerWidget {
  const HealthSyncScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider<HealthSyncBloc>(
      create: (_) => ref.read(healthSyncBlocProvider)..add(const LoadSyncStatus()),
      child: const _HealthSyncView(),
    );
  }
}

class _HealthSyncView extends StatelessWidget {
  const _HealthSyncView();

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.healthSyncTitle),
      ),
      body: BlocConsumer<HealthSyncBloc, HealthSyncState>(
        listener: (context, state) {
          if (state is HealthSyncError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is HealthSyncInitial || state is HealthSyncLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is HealthSyncLoaded) {
            return _HealthSyncForm(loadedState: state);
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _HealthSyncForm extends StatelessWidget {
  final HealthSyncLoaded loadedState;

  const _HealthSyncForm({required this.loadedState});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        if (!loadedState.isAuthorized)
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    l10n.healthSyncPermissionRequired,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  FilledButton(
                    onPressed: () {
                      context
                          .read<HealthSyncBloc>()
                          .add(const RequestPermissions());
                    },
                    child: Text(l10n.healthSyncGrantPermission),
                  ),
                ],
              ),
            ),
          ),
        if (loadedState.isAuthorized) ...[
          Text(
            l10n.healthSyncDataTypes,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8.0),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.directions_walk_outlined),
            title: Text(l10n.healthSyncSteps),
            value: loadedState.stepsEnabled,
            onChanged: (enabled) {
              context
                  .read<HealthSyncBloc>()
                  .add(ToggleStepsSync(enabled: enabled));
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.fitness_center_outlined),
            title: Text(l10n.healthSyncWorkouts),
            value: loadedState.workoutsEnabled,
            onChanged: (enabled) {
              context
                  .read<HealthSyncBloc>()
                  .add(ToggleWorkoutsSync(enabled: enabled));
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            secondary: const Icon(Icons.monitor_weight_outlined),
            title: Text(l10n.healthSyncWeight),
            value: loadedState.weightEnabled,
            onChanged: (enabled) {
              context
                  .read<HealthSyncBloc>()
                  .add(ToggleWeightSync(enabled: enabled));
            },
          ),
          const SizedBox(height: 24.0),
          if (loadedState.lastSyncTimestamp != null)
            Text(
              l10n.healthSyncLastSync(
                _formatTimestamp(loadedState.lastSyncTimestamp!),
              ),
              style: Theme.of(context).textTheme.bodySmall,
            )
          else
            Text(
              l10n.healthSyncNeverSynced,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          const SizedBox(height: 16.0),
          FilledButton(
            onPressed: () {
              context.read<HealthSyncBloc>().add(const SyncAll());
            },
            child: Text(l10n.healthSyncNow),
          ),
        ],
        if (loadedState.syncedSteps != null) ...[
          const SizedBox(height: 16.0),
          Text(
            l10n.healthSyncStepsResult(loadedState.syncedSteps!),
            style: Theme.of(context).textTheme.bodyMedium,
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
