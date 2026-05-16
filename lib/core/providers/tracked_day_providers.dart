import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/progress/get_monthly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/progress/get_weekly_nutrition_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getTrackedDayUsecaseProvider = Provider((ref) {
  return GetTrackedDayUsecase(ref.watch(trackedDayRepositoryProvider));
});

final addTrackedDayUsecaseProvider = Provider((ref) {
  return AddTrackedDayUsecase(ref.watch(trackedDayRepositoryProvider));
});

final getWeeklyNutritionUsecaseProvider = Provider((ref) {
  return GetWeeklyNutritionUsecase(ref.watch(trackedDayRepositoryProvider));
});

final getMonthlyNutritionUsecaseProvider = Provider((ref) {
  return GetMonthlyNutritionUsecase(ref.watch(trackedDayRepositoryProvider));
});