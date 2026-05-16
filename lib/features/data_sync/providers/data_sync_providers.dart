import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/data/encrypted_backup_service.dart';
import 'package:nutriq/core/providers/database_provider.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/features/settings/domain/usecase/export_data_usecase.dart';
import 'package:nutriq/features/settings/domain/usecase/import_data_usecase.dart';

final dataExportServiceProvider = Provider((ref) {
  return DataExportService(ref.watch(appDatabaseProvider));
});

final dataImportServiceProvider = Provider((ref) {
  return DataImportService(ref.watch(appDatabaseProvider));
});

final encryptedBackupServiceProvider = Provider((ref) {
  return EncryptedBackupService(
    ref.watch(dataExportServiceProvider),
    ref.watch(dataImportServiceProvider),
  );
});

final exportDataUsecaseProvider = Provider((ref) {
  return ExportDataUsecase(
    ref.watch(userActivityRepositoryProvider),
    ref.watch(intakeRepositoryProvider),
    ref.watch(trackedDayRepositoryProvider),
  );
});

final importDataUsecaseProvider = Provider((ref) {
  return ImportDataUsecase(
    ref.watch(userActivityRepositoryProvider),
    ref.watch(intakeRepositoryProvider),
    ref.watch(trackedDayRepositoryProvider),
  );
});