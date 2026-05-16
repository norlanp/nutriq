import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/autopilot/adjust_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/calculate_exercise_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/get_autopilot_status_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/toggle_autopilot_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/providers/service_providers.dart';

final getAutopilotStatusUsecaseProvider = Provider((ref) {
  return GetAutopilotStatusUsecase(ref.watch(autopilotRepositoryProvider));
});

final toggleAutopilotUsecaseProvider = Provider((ref) {
  return ToggleAutopilotUsecase(ref.watch(autopilotRepositoryProvider));
});

final adjustBudgetUsecaseProvider = Provider((ref) {
  return AdjustBudgetUsecase(
    ref.watch(autopilotRepositoryProvider),
    ref.watch(weightRepositoryProvider),
    ref.watch(autopilotServiceProvider),
  );
});

final calculateExerciseBudgetUsecaseProvider = Provider((ref) {
  return CalculateExerciseBudgetUsecase();
});