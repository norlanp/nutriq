import 'package:equatable/equatable.dart';

abstract class DataSyncState extends Equatable {
  const DataSyncState();
}

class DataSyncInitial extends DataSyncState {
  @override
  List<Object?> get props => [];
}

class DataSyncLoading extends DataSyncState {
  @override
  List<Object?> get props => [];
}

class DataSyncExportSuccess extends DataSyncState {
  final String filePath;

  const DataSyncExportSuccess(this.filePath);

  @override
  List<Object?> get props => [filePath];
}

class DataSyncImportSuccess extends DataSyncState {
  @override
  List<Object?> get props => [];
}

class DataSyncImportPreview extends DataSyncState {
  final Map<String, dynamic> data;

  const DataSyncImportPreview(this.data);

  @override
  List<Object?> get props => [data];
}

class DataSyncBackupSuccess extends DataSyncState {
  final String filePath;

  const DataSyncBackupSuccess(this.filePath);

  @override
  List<Object?> get props => [filePath];
}

class DataSyncBackupStatus extends DataSyncState {
  final DateTime? lastBackupDate;
  final String? lastBackupPath;

  const DataSyncBackupStatus({this.lastBackupDate, this.lastBackupPath});

  @override
  List<Object?> get props => [lastBackupDate, lastBackupPath];
}

class DataSyncError extends DataSyncState {
  final String message;

  const DataSyncError(this.message);

  @override
  List<Object?> get props => [message];
}
