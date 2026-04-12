import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/data/encrypted_backup_service.dart';
import 'package:nutriq/core/utils/locator.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_bloc.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_event.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_state.dart';
import 'package:nutriq/generated/l10n.dart';

class ExportScreen extends StatelessWidget {
  const ExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DataSyncBloc>(
      create: (_) => DataSyncBloc(
        locator<DataExportService>(),
        locator<DataImportService>(),
        locator<EncryptedBackupService>(),
      ),
      child: const _ExportView(),
    );
  }
}

class _ExportView extends StatefulWidget {
  const _ExportView();

  @override
  State<_ExportView> createState() => _ExportViewState();
}

class _ExportViewState extends State<_ExportView> {
  final Set<DataType> _selectedTypes = DataType.values.toSet();
  ExportFormat _format = ExportFormat.json;

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.dataSyncExportTitle),
      ),
      body: BlocConsumer<DataSyncBloc, DataSyncState>(
        listener: (context, state) {
          if (state is DataSyncExportSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.dataSyncExportSuccess)),
            );
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
                l10n.dataSyncSelectDataTypes,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              ...DataType.values.map((type) => _buildTypeCheckbox(type, l10n)),
              const SizedBox(height: 24),
              Text(
                l10n.dataSyncSelectFormat,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              SegmentedButton<ExportFormat>(
                segments: [
                  ButtonSegment(
                    value: ExportFormat.json,
                    label: Text(l10n.dataSyncFormatJson),
                  ),
                  ButtonSegment(
                    value: ExportFormat.csv,
                    label: Text(l10n.dataSyncFormatZip),
                  ),
                ],
                selected: {_format},
                onSelectionChanged: (selection) {
                  setState(() => _format = selection.first);
                },
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: _selectedTypes.isEmpty
                    ? null
                    : () {
                        context
                            .read<DataSyncBloc>()
                            .add(ExportDataEvent(_selectedTypes, _format));
                      },
                child: Text(l10n.exportAction),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.dataSyncEncryptBackup,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.dataSyncEncryptBackupDescription,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: _selectedTypes.isEmpty
                    ? null
                    : () => _showEncryptDialog(context),
                child: Text(l10n.dataSyncCreateEncryptedBackup),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTypeCheckbox(DataType type, S l10n) {
    return CheckboxListTile(
      value: _selectedTypes.contains(type),
      title: Text(_dataTypeLabel(type, l10n)),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) {
        setState(() {
          if (checked == true) {
            _selectedTypes.add(type);
          } else {
            _selectedTypes.remove(type);
          }
        });
      },
    );
  }

  String _dataTypeLabel(DataType type, S l10n) {
    switch (type) {
      case DataType.config:
        return l10n.dataSyncTypeConfig;
      case DataType.users:
        return l10n.dataSyncTypeUsers;
      case DataType.intakes:
        return l10n.dataSyncTypeIntakes;
      case DataType.meals:
        return l10n.dataSyncTypeMeals;
      case DataType.userActivities:
        return l10n.dataSyncTypeActivities;
      case DataType.trackedDays:
        return l10n.dataSyncTypeTrackedDays;
      case DataType.recipes:
        return l10n.dataSyncTypeRecipes;
      case DataType.weights:
        return l10n.dataSyncTypeWeights;
      case DataType.notificationSettings:
        return l10n.dataSyncTypeNotificationSettings;
      case DataType.waterEntries:
        return l10n.dataSyncTypeWaterEntries;
      case DataType.fasts:
        return l10n.dataSyncTypeFasts;
      case DataType.mealPlans:
        return l10n.dataSyncTypeMealPlans;
    }
  }

  void _showEncryptDialog(BuildContext context) {
    final passwordController = TextEditingController();
    final confirmController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(S.of(context).dataSyncEncryptBackup),
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
                  SnackBar(
                      content: Text(S.of(context).dataSyncPasswordMismatch)),
                );
                return;
              }
              Navigator.of(dialogContext).pop();
              context.read<DataSyncBloc>().add(
                    CreateEncryptedBackupEvent(
                      _selectedTypes,
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
}
