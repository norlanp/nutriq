import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_bloc.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_event.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_state.dart';
import 'package:nutriq/generated/l10n.dart';

class ImportScreen extends ConsumerWidget {
  const ImportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BlocProvider<DataSyncBloc>(
      create: (_) => DataSyncBloc(
        ref.read(dataExportServiceProvider),
        ref.read(dataImportServiceProvider),
        ref.read(encryptedBackupServiceProvider),
      ),
      child: const _ImportView(),
    );
  }
}

class _ImportView extends ConsumerWidget {
  const _ImportView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dataSyncImportTitle),
      ),
      body: BlocConsumer<DataSyncBloc, DataSyncState>(
        listener: (context, state) {
          if (state is DataSyncImportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.dataSyncImportSuccess)),
            );
          } else if (state is DataSyncImportPreview) {
            _showPreviewDialog(context, ref, state.data);
          } else if (state is DataSyncError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is DataSyncLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                l10n.dataSyncImportDescription,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => _handleJsonImport(context),
                icon: const Icon(Icons.description_outlined),
                label: Text(l10n.dataSyncImportJson),
              ),
              const SizedBox(height: 12),
              FilledButton.icon(
                onPressed: () => _handleZipImport(context),
                icon: const Icon(Icons.folder_zip_outlined),
                label: Text(l10n.dataSyncImportZip),
              ),
              const SizedBox(height: 24),
              Text(
                l10n.dataSyncEncryptedRestore,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => _handleEncryptedRestore(context),
                icon: const Icon(Icons.lock_outline),
                label: Text(l10n.dataSyncRestoreEncrypted),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleJsonImport(BuildContext context) {
    context.read<DataSyncBloc>().add(const ImportDataEvent(isZip: false));
  }

  void _handleZipImport(BuildContext context) {
    context.read<DataSyncBloc>().add(const ImportDataEvent(isZip: true));
  }

  void _handleEncryptedRestore(BuildContext context) {
    final passwordController = TextEditingController();
    final pathController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(context).dataSyncRestoreEncrypted),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: pathController,
              decoration: InputDecoration(
                labelText: S.of(context).dataSyncBackupFilePath,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: S.of(context).dataSyncPassword,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(S.of(context).dialogCancelLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<DataSyncBloc>().add(
                    RestoreEncryptedBackupEvent(
                      pathController.text,
                      passwordController.text,
                    ),
                  );
            },
            child: Text(S.of(context).dialogOKLabel),
          ),
        ],
      ),
    );
  }

  void _showPreviewDialog(BuildContext context, WidgetRef ref, Map<String, dynamic> data) {
    final l10n = S.of(context);
    final importService = ref.read(dataImportServiceProvider);
    final entries = <Widget>[];

    final typeLabels = {
      'config': l10n.dataSyncTypeConfig,
      'users': l10n.dataSyncTypeUsers,
      'intakes': l10n.dataSyncTypeIntakes,
      'meals': l10n.dataSyncTypeMeals,
      'userActivities': l10n.dataSyncTypeActivities,
      'trackedDays': l10n.dataSyncTypeTrackedDays,
      'recipes': l10n.dataSyncTypeRecipes,
      'recipeItems': l10n.dataSyncTypeRecipes,
      'weights': l10n.dataSyncTypeWeights,
      'notificationSettings': l10n.dataSyncTypeNotificationSettings,
      'waterEntries': l10n.dataSyncTypeWaterEntries,
      'fasts': l10n.dataSyncTypeFasts,
      'mealPlans': l10n.dataSyncTypeMealPlans,
    };

    for (final entry in data.entries) {
      final count = importService.countRecords(data, entry.key);
      final label = typeLabels[entry.key] ?? entry.key;
      entries.add(ListTile(
        title: Text(label),
        trailing: Text('$count ${l10n.dataSyncRecords}'),
      ));
    }

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(l10n.dataSyncPreviewTitle),
        content: SizedBox(
          width: double.maxFinite,
          child: ListView(
            shrinkWrap: true,
            children: entries,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(l10n.dialogCancelLabel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<DataSyncBloc>().add(const ImportDataEvent());
            },
            child: Text(l10n.importAction),
          ),
        ],
      ),
    );
  }
}
