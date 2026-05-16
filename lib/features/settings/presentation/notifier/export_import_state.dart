import 'package:equatable/equatable.dart';

enum ExportImportStatus { initial, loading, success, error }

class ExportImportState extends Equatable {
  final ExportImportStatus status;

  const ExportImportState({this.status = ExportImportStatus.initial});

  @override
  List<Object?> get props => [status];
}