import 'package:equatable/equatable.dart';
import 'package:nutriq/core/data/data_export_service.dart';

enum DataSyncStatus {
  initial,
  loading,
  exportSuccess,
  importSuccess,
  importPreview,
  backupSuccess,
  backupStatus,
  error,
}

class DataSyncState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final DataSyncStatus status;
  final String? filePath;
  final Map<String, dynamic>? previewData;
  final DateTime? lastBackupDate;
  final String? lastBackupPath;
  final Set<DataType>? exportDataTypes;
  final ExportFormat? exportFormat;

  const DataSyncState({
    this.isLoading = false,
    this.errorMessage,
    this.status = DataSyncStatus.initial,
    this.filePath,
    this.previewData,
    this.lastBackupDate,
    this.lastBackupPath,
    this.exportDataTypes,
    this.exportFormat,
  });

  bool get hasError => errorMessage != null;

  DataSyncState copyWith({
    bool? isLoading,
    String? errorMessage,
    DataSyncStatus? status,
    String? filePath,
    Map<String, dynamic>? previewData,
    DateTime? lastBackupDate,
    String? lastBackupPath,
    Set<DataType>? exportDataTypes,
    ExportFormat? exportFormat,
  }) {
    return DataSyncState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      status: status ?? this.status,
      filePath: filePath,
      previewData: previewData,
      lastBackupDate: lastBackupDate ?? this.lastBackupDate,
      lastBackupPath: lastBackupPath ?? this.lastBackupPath,
      exportDataTypes: exportDataTypes ?? this.exportDataTypes,
      exportFormat: exportFormat ?? this.exportFormat,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        status,
        filePath,
        previewData,
        lastBackupDate,
        lastBackupPath,
        exportDataTypes,
        exportFormat,
      ];
}