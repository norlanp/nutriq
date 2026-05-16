import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/weight/add_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/delete_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_in_range_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getWeightsUsecaseProvider = Provider((ref) {
  return GetWeightsUsecase(ref.watch(weightRepositoryProvider));
});

final addWeightUsecaseProvider = Provider((ref) {
  return AddWeightUsecase(ref.watch(weightRepositoryProvider));
});

final deleteWeightUsecaseProvider = Provider((ref) {
  return DeleteWeightUsecase(ref.watch(weightRepositoryProvider));
});

final getWeightsInRangeUsecaseProvider = Provider((ref) {
  return GetWeightsInRangeUsecase(ref.watch(weightRepositoryProvider));
});