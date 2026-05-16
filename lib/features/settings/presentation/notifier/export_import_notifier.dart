import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/settings/presentation/notifier/export_import_state.dart';

class ExportImportNotifier extends Notifier<ExportImportState> {
  static const exportZipFileName = 'nutriq-export.zip';
  static const userActivityJsonFileName = 'user_activity.json';
  static const userIntakeJsonFileName = 'user_intake.json';
  static const trackedDayJsonFileName = 'user_tracked_day.json';

  @override
  ExportImportState build() {
    return const ExportImportState();
  }

  Future<void> exportData() async {
    state = const ExportImportState(status: ExportImportStatus.loading);
    try {
      final result = await ref.read(exportDataUsecaseProvider).exportData(
            exportZipFileName,
            userActivityJsonFileName,
            userIntakeJsonFileName,
            trackedDayJsonFileName,
          );
      if (result) {
        state = const ExportImportState(status: ExportImportStatus.success);
      } else {
        state = const ExportImportState(status: ExportImportStatus.initial);
      }
    } catch (_) {
      state = const ExportImportState(status: ExportImportStatus.error);
    }
  }

  Future<void> importData() async {
    state = const ExportImportState(status: ExportImportStatus.loading);
    try {
      final result = await ref.read(importDataUsecaseProvider).importData(
            userActivityJsonFileName,
            userIntakeJsonFileName,
            trackedDayJsonFileName,
          );
      if (result) {
        state = const ExportImportState(status: ExportImportStatus.success);
      } else {
        state = const ExportImportState(status: ExportImportStatus.initial);
      }
    } catch (_) {
      state = const ExportImportState(status: ExportImportStatus.error);
    }
  }
}

final exportImportNotifierProvider =
    NotifierProvider<ExportImportNotifier, ExportImportState>(
        ExportImportNotifier.new);