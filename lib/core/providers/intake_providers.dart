import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/add_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/update_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_all_intakes_ordered_by_time_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_intakes_by_date_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final getIntakeUsecaseProvider = Provider((ref) {
  return GetIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final addIntakeUsecaseProvider = Provider((ref) {
  return AddIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final deleteIntakeUsecaseProvider = Provider((ref) {
  return DeleteIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final updateIntakeUsecaseProvider = Provider((ref) {
  return UpdateIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final getIntakesByDateUsecaseProvider = Provider((ref) {
  return GetIntakesByDateUsecase(ref.watch(intakeRepositoryProvider));
});

final getAllIntakesOrderedByTimeUsecaseProvider = Provider((ref) {
  return GetAllIntakesOrderedByTimeUsecase(ref.watch(intakeRepositoryProvider));
});