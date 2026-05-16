import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/providers/data_source_providers.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final appInitializerProvider = Provider<Future<void>>((ref) async {
  final configDataSource = ref.watch(configDataSourceProvider);
  if (!await configDataSource.configInitialized()) {
    await configDataSource.initializeConfig();
  }
});