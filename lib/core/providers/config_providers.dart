import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getConfigUsecaseProvider = Provider((ref) {
  return GetConfigUsecase(ref.watch(configRepositoryProvider));
});

final addConfigUsecaseProvider = Provider((ref) {
  return AddConfigUsecase(ref.watch(configRepositoryProvider));
});