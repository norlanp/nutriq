import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/fasting/end_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_active_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_current_streak_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_fasting_history_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/start_fasting_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final startFastingUsecaseProvider = Provider((ref) {
  return StartFastingUsecase(ref.watch(fastingRepositoryProvider));
});

final endFastingUsecaseProvider = Provider((ref) {
  return EndFastingUsecase(ref.watch(fastingRepositoryProvider));
});

final getActiveFastingUsecaseProvider = Provider((ref) {
  return GetActiveFastingUsecase(ref.watch(fastingRepositoryProvider));
});

final getCurrentStreakUsecaseProvider = Provider((ref) {
  return GetCurrentStreakUsecase(ref.watch(fastingRepositoryProvider));
});

final getFastingHistoryUsecaseProvider = Provider((ref) {
  return GetFastingHistoryUsecase(ref.watch(fastingRepositoryProvider));
});