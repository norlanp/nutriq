import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/step_bonus/calculate_step_bonus_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_steps_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_weight_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_workouts_usecase.dart';

final syncStepsUsecaseProvider = Provider((ref) {
  return SyncStepsUsecase(ref.watch(healthSyncServiceProvider));
});

final syncWorkoutsUsecaseProvider = Provider((ref) {
  return SyncWorkoutsUsecase(ref.watch(healthSyncServiceProvider));
});

final syncWeightUsecaseProvider = Provider((ref) {
  return SyncWeightUsecase(
    ref.watch(healthSyncServiceProvider),
    ref.watch(weightRepositoryProvider),
  );
});

final calculateStepBonusUsecaseProvider = Provider((ref) {
  return CalculateStepBonusUsecase(ref.watch(healthSyncServiceProvider));
});