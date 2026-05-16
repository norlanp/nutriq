import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/drift/app_database.dart';

final appDatabaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});