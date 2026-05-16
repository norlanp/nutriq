import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getUserUsecaseProvider = Provider((ref) {
  return GetUserUsecase(ref.watch(userRepositoryProvider));
});

final addUserUsecaseProvider = Provider((ref) {
  return AddUserUsecase(ref.watch(userRepositoryProvider));
});