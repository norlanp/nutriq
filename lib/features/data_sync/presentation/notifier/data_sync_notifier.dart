import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/data_sync/presentation/notifier/data_sync_state.dart';
import 'package:share_plus/share_plus.dart';

class DataSyncNotifier extends Notifier<DataSyncState> {
  @override
  DataSyncState build() => const DataSyncState();

  Future<void> exportData(Set<DataType> dataTypes, ExportFormat format) async {
    state = const DataSyncState(isLoading: true, status: DataSyncStatus.loading);
    try {
      final exportService = ref.read(dataExportServiceProvider);
      final filePath = await exportService.exportData(dataTypes, format);
      await Share.shareXFiles([XFile(filePath)]);
      state = DataSyncState(status: DataSyncStatus.exportSuccess, filePath: filePath);
    } catch (e) {
      state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Export failed. Please try again.');
    }
  }

  Future<void> importData({bool isZip = false}) async {
    state = const DataSyncState(isLoading: true, status: DataSyncStatus.loading);
    try {
      final importService = ref.read(dataImportServiceProvider);
      final ImportResult result;
      if (isZip) {
        result = await importService.importFromZipFile();
      } else {
        result = await importService.importFromJsonFile();
      }

      if (result == ImportResult.success) {
        state = const DataSyncState(status: DataSyncStatus.importSuccess);
      } else if (result == ImportResult.cancelled) {
        state = const DataSyncState();
      } else {
        state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Import failed. The file may be corrupted or in an unsupported format.');
      }
    } catch (e) {
      state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Import failed. Please check the file and try again.');
    }
  }

  Future<void> previewImportData({bool isZip = false}) async {
    state = const DataSyncState(isLoading: true, status: DataSyncStatus.loading);
    try {
      final importService = ref.read(dataImportServiceProvider);
      final Map<String, dynamic>? data;
      if (isZip) {
        data = await importService.previewFromZipFile();
      } else {
        data = await importService.previewFromJsonFile();
      }

      if (data != null) {
        state = DataSyncState(status: DataSyncStatus.importPreview, previewData: data);
      } else {
        state = const DataSyncState();
      }
    } catch (e) {
      state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Could not preview data. Please check the file and try again.');
    }
  }

  Future<void> createEncryptedBackup(Set<DataType> dataTypes, String password) async {
    state = const DataSyncState(isLoading: true, status: DataSyncStatus.loading);
    try {
      final backupService = ref.read(encryptedBackupServiceProvider);
      final filePath = await backupService.createEncryptedBackup(dataTypes, password);
      state = DataSyncState(status: DataSyncStatus.backupSuccess, filePath: filePath);
    } catch (e) {
      state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Backup creation failed. Please try again.');
    }
  }

  Future<void> restoreEncryptedBackup(String filePath, String password) async {
    state = const DataSyncState(isLoading: true, status: DataSyncStatus.loading);
    try {
      final backupService = ref.read(encryptedBackupServiceProvider);
      final result = await backupService.restoreFromEncryptedBackup(filePath, password);
      if (result == ImportResult.success) {
        state = const DataSyncState(status: DataSyncStatus.importSuccess);
      } else {
        state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Could not decrypt backup. Check your password and try again.');
      }
    } catch (e) {
      state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Restore failed. Check your password and file path, then try again.');
    }
  }

  Future<void> loadBackupStatus() async {
    try {
      final backupService = ref.read(encryptedBackupServiceProvider);
      final lastDate = await backupService.getLastBackupDate();
      final lastPath = await backupService.getLastBackupPath();
      state = DataSyncState(
        status: DataSyncStatus.backupStatus,
        lastBackupDate: lastDate,
        lastBackupPath: lastPath,
      );
    } catch (e) {
      state = const DataSyncState(status: DataSyncStatus.error, errorMessage: 'Could not load backup status.');
    }
  }
}

final dataSyncNotifierProvider =
    NotifierProvider<DataSyncNotifier, DataSyncState>(DataSyncNotifier.new);