import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/create_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/delete_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/get_tracker_entries_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/log_tracker_entry_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final createCustomTrackerUsecaseProvider = Provider((ref) {
  return CreateCustomTrackerUsecase(ref.watch(customTrackerRepositoryProvider));
});

final deleteCustomTrackerUsecaseProvider = Provider((ref) {
  return DeleteCustomTrackerUsecase(ref.watch(customTrackerRepositoryProvider));
});

final logTrackerEntryUsecaseProvider = Provider((ref) {
  return LogTrackerEntryUsecase(ref.watch(customTrackerRepositoryProvider));
});

final getTrackerEntriesUsecaseProvider = Provider((ref) {
  return GetTrackerEntriesUsecase(ref.watch(customTrackerRepositoryProvider));
});