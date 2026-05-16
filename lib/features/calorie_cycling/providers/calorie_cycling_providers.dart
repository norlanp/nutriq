import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/get_calorie_cycle_usecase.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/save_calorie_cycle_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getCalorieCycleUsecaseProvider = Provider((ref) {
  return GetCalorieCycleUsecase(ref.watch(configRepositoryProvider));
});

final saveCalorieCycleUsecaseProvider = Provider((ref) {
  return SaveCalorieCycleUsecase(ref.watch(configRepositoryProvider));
});