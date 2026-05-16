import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/add_user_activity_usercase.dart';
import 'package:nutriq/core/domain/usecase/delete_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_physical_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_activity_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getUserActivityUsecaseProvider = Provider((ref) {
  return GetUserActivityUsecase(ref.watch(userActivityRepositoryProvider));
});

final addUserActivityUsecaseProvider = Provider((ref) {
  return AddUserActivityUsecase(ref.watch(userActivityRepositoryProvider));
});

final deleteUserActivityUsecaseProvider = Provider((ref) {
  return DeleteUserActivityUsecase(ref.watch(userActivityRepositoryProvider));
});

final getPhysicalActivityUsecaseProvider = Provider((ref) {
  return GetPhysicalActivityUsecase(
      ref.watch(physicalActivityRepositoryProvider));
});