import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/features/data_sync/presentation/notifier/data_sync_notifier.dart';
import 'package:nutriq/features/data_sync/presentation/notifier/data_sync_state.dart';
import 'package:nutriq/generated/l10n.dart';

class CloudBackupSettingsScreen extends ConsumerWidget {
  const CloudBackupSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(dataSyncNotifierProvider.notifier);
    notifier.loadBackupStatus();
    return const _CloudBackupSettingsView();
  }
}

class _CloudBackupSettingsView extends ConsumerWidget {
  const _CloudBackupSettingsView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = S.of(context);
    final state = ref.watch(dataSyncNotifierProvider);
    final notifier = ref.read(dataSyncNotifierProvider.notifier);

    ref.listen<DataSyncState>(dataSyncNotifierProvider, (prev, next) {
      if (next.status == DataSyncStatus.backupSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.dataSyncBackupCreated)),
        );
        notifier.loadBackupStatus();
      } else if (next.status == DataSyncStatus.error && next.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.errorMessage!)),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dataSyncCloudBackupTitle),
      ),
      body: state.isLoading
          ? const Center(child: CircularProgressIndicator())
          : state.status == DataSyncStatus.backupStatus
              ? ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.dataSyncLastBackup,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              state.lastBackupDate != null
                                  ? _formatDate(state.lastBackupDate!)
                                  : l10n.dataSyncNoBackup,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.dataSyncCloudProvider,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    ListTile(
                      leading: const Icon(Icons.cloud_outlined),
                      title: const Text('iCloud'),
                      subtitle: Text(l10n.dataSyncComingSoon),
                      enabled: false,
                    ),
                    ListTile(
                      leading: const Icon(Icons.cloud_outlined),
                      title: const Text('Google Drive'),
                      subtitle: Text(l10n.dataSyncComingSoon),
                      enabled: false,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.dataSyncLocalEncryption,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.dataSyncLocalEncryptionDescription,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: () => _showCreateBackupDialog(context, notifier),
                      icon: const Icon(Icons.lock_outline),
                      label: Text(l10n.dataSyncCreateEncryptedBackup),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton.icon(
                      onPressed: () => _showRestoreBackupDialog(context, notifier),
                      icon: const Icon(Icons.restore),
                      label: Text(l10n.dataSyncRestoreFromBackup),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} '
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _showCreateBackupDialog(BuildContext context, DataSyncNotifier notifier) {
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(context).dataSyncCreateEncryptedBackup),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: S.of(context).dataSyncPassword,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: confirmController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: S.of(context).dataSyncConfirmPassword,
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
              if (passwordController.text.isEmpty ||
                  passwordController.text != confirmController.text) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(S.of(context).dataSyncPasswordMismatch)),
                );
                return;
              }
              Navigator.of(dialogContext).pop();
              notifier.createEncryptedBackup(
                DataType.values.toSet(),
                passwordController.text,
              );
            },
            child: Text(S.of(context).dialogOKLabel),
          ),
        ],
      ),
    );
  }

  void _showRestoreBackupDialog(BuildContext context, DataSyncNotifier notifier) {
    final pathController = TextEditingController();
    final passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(context).dataSyncRestoreFromBackup),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: pathController,
              decoration: InputDecoration(
                labelText: S.of(context).dataSyncBackupFilePath,
                hintText: S.of(context).dataSyncBackupPathHint,
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
              notifier.restoreEncryptedBackup(pathController.text, passwordController.text);
            },
            child: Text(S.of(context).dialogOKLabel),
          ),
        ],
      ),
    );
  }
}