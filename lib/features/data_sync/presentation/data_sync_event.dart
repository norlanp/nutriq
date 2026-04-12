import 'package:equatable/equatable.dart';
import 'package:nutriq/core/data/data_export_service.dart';

abstract class DataSyncEvent extends Equatable {
  const DataSyncEvent();
}

class ExportDataEvent extends DataSyncEvent {
  final Set<DataType> dataTypes;
  final ExportFormat format;

  const ExportDataEvent(this.dataTypes, this.format);

  @override
  List<Object?> get props => [dataTypes, format];
}

class ImportDataEvent extends DataSyncEvent {
  final bool isZip;

  const ImportDataEvent({this.isZip = false});

  @override
  List<Object?> get props => [isZip];
}

class PreviewImportDataEvent extends DataSyncEvent {
  final bool isZip;

  const PreviewImportDataEvent({this.isZip = false});

  @override
  List<Object?> get props => [isZip];
}

class CreateEncryptedBackupEvent extends DataSyncEvent {
  final Set<DataType> dataTypes;
  final String password;

  const CreateEncryptedBackupEvent(this.dataTypes, this.password);

  @override
  List<Object?> get props => [dataTypes, password];
}

class RestoreEncryptedBackupEvent extends DataSyncEvent {
  final String filePath;
  final String password;

  const RestoreEncryptedBackupEvent(this.filePath, this.password);

  @override
  List<Object?> get props => [filePath, password];
}

class LoadBackupStatusEvent extends DataSyncEvent {
  const LoadBackupStatusEvent();

  @override
  List<Object?> get props => [];
}
