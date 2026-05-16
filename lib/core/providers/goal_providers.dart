import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/bmr/calculate_bmr_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getKcalGoalUsecaseProvider = Provider((ref) {
  return GetKcalGoalUsecase(
    ref.watch(userRepositoryProvider),
    ref.watch(configRepositoryProvider),
    ref.watch(userActivityRepositoryProvider),
  );
});

final getMacroGoalUsecaseProvider = Provider((ref) {
  return GetMacroGoalUsecase(ref.watch(configRepositoryProvider));
});

final calculateBMRUsecaseProvider = Provider((ref) {
  return CalculateBMRUsecase();
});