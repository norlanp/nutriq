import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/exercise/get_daily_burned_calories_usecase.dart';
import 'package:nutriq/core/domain/usecase/exercise/net_calories_usecase.dart';
import 'package:nutriq/core/domain/usecase/net_carbs/net_carbs_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getDailyBurnedCaloriesUsecaseProvider = Provider((ref) {
  return GetDailyBurnedCaloriesUsecase(
      ref.watch(userActivityRepositoryProvider));
});

final netCaloriesUsecaseProvider = Provider((ref) {
  return NetCaloriesUsecase(ref.watch(getDailyBurnedCaloriesUsecaseProvider));
});

final netCarbsUsecaseProvider = Provider((ref) {
  return NetCarbsUsecase(ref.watch(configRepositoryProvider));
});