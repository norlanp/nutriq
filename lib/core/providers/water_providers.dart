import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/water/add_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/delete_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_daily_water_total_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_water_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getWaterUsecaseProvider = Provider((ref) {
  return GetWaterUsecase(ref.watch(waterRepositoryProvider));
});

final addWaterUsecaseProvider = Provider((ref) {
  return AddWaterUsecase(ref.watch(waterRepositoryProvider));
});

final deleteWaterUsecaseProvider = Provider((ref) {
  return DeleteWaterUsecase(ref.watch(waterRepositoryProvider));
});

final getDailyWaterTotalUsecaseProvider = Provider((ref) {
  return GetDailyWaterTotalUsecase(ref.watch(waterRepositoryProvider));
});