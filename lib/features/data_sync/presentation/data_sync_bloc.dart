import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/data/encrypted_backup_service.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_event.dart';
import 'package:nutriq/features/data_sync/presentation/data_sync_state.dart';
import 'package:share_plus/share_plus.dart';

class DataSyncBloc extends Bloc<DataSyncEvent, DataSyncState> {
  final DataExportService _exportService;
  final DataImportService _importService;
  final EncryptedBackupService _backupService;

  DataSyncBloc(this._exportService, this._importService, this._backupService)
      : super(DataSyncInitial()) {
    on<ExportDataEvent>(_onExportData);
    on<ImportDataEvent>(_onImportData);
    on<PreviewImportDataEvent>(_onPreviewImportData);
    on<CreateEncryptedBackupEvent>(_onCreateEncryptedBackup);
    on<RestoreEncryptedBackupEvent>(_onRestoreEncryptedBackup);
    on<LoadBackupStatusEvent>(_onLoadBackupStatus);
  }

  Future<void> _onExportData(
    ExportDataEvent event,
    Emitter<DataSyncState> emit,
  ) async {
    emit(DataSyncLoading());
    try {
      final filePath = await _exportService.exportData(
        event.dataTypes,
        event.format,
      );
      await Share.shareXFiles([XFile(filePath)]);
      emit(DataSyncExportSuccess(filePath));
    } catch (e) {
      emit(DataSyncError(e.toString()));
    }
  }

  Future<void> _onImportData(
    ImportDataEvent event,
    Emitter<DataSyncState> emit,
  ) async {
    emit(DataSyncLoading());
    try {
      final ImportResult result;
      if (event.isZip) {
        result = await _importService.importFromZipFile();
      } else {
        result = await _importService.importFromJsonFile();
      }

      if (result == ImportResult.success) {
        emit(DataSyncImportSuccess());
      } else if (result == ImportResult.cancelled) {
        emit(DataSyncInitial());
      } else {
        emit(const DataSyncError('Import failed'));
      }
    } catch (e) {
      emit(DataSyncError(e.toString()));
    }
  }

  Future<void> _onPreviewImportData(
    PreviewImportDataEvent event,
    Emitter<DataSyncState> emit,
  ) async {
    emit(DataSyncLoading());
    try {
      final Map<String, dynamic>? data;
      if (event.isZip) {
        data = await _importService.previewFromZipFile();
      } else {
        data = await _importService.previewFromJsonFile();
      }

      if (data != null) {
        emit(DataSyncImportPreview(data));
      } else {
        emit(DataSyncInitial());
      }
    } catch (e) {
      emit(DataSyncError(e.toString()));
    }
  }

  Future<void> _onCreateEncryptedBackup(
    CreateEncryptedBackupEvent event,
    Emitter<DataSyncState> emit,
  ) async {
    emit(DataSyncLoading());
    try {
      final filePath = await _backupService.createEncryptedBackup(
        event.dataTypes,
        event.password,
      );
      emit(DataSyncBackupSuccess(filePath));
    } catch (e) {
      emit(DataSyncError(e.toString()));
    }
  }

  Future<void> _onRestoreEncryptedBackup(
    RestoreEncryptedBackupEvent event,
    Emitter<DataSyncState> emit,
  ) async {
    emit(DataSyncLoading());
    try {
      final result = await _backupService.restoreFromEncryptedBackup(
        event.filePath,
        event.password,
      );
      if (result == ImportResult.success) {
        emit(DataSyncImportSuccess());
      } else {
        emit(const DataSyncError('Failed to decrypt backup'));
      }
    } catch (e) {
      emit(DataSyncError(e.toString()));
    }
  }

  Future<void> _onLoadBackupStatus(
    LoadBackupStatusEvent event,
    Emitter<DataSyncState> emit,
  ) async {
    try {
      final lastDate = await _backupService.getLastBackupDate();
      final lastPath = await _backupService.getLastBackupPath();
      emit(DataSyncBackupStatus(
        lastBackupDate: lastDate,
        lastBackupPath: lastPath,
      ));
    } catch (e) {
      emit(DataSyncError(e.toString()));
    }
  }
}
