import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/add_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/delete_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_average_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final addBloodGlucoseUsecaseProvider = Provider((ref) {
  return AddBloodGlucoseUsecase(ref.watch(bloodGlucoseRepositoryProvider));
});

final deleteBloodGlucoseUsecaseProvider = Provider((ref) {
  return DeleteBloodGlucoseUsecase(ref.watch(bloodGlucoseRepositoryProvider));
});

final getBloodGlucoseUsecaseProvider = Provider((ref) {
  return GetBloodGlucoseUsecase(ref.watch(bloodGlucoseRepositoryProvider));
});

final getBloodGlucoseAverageUsecaseProvider = Provider((ref) {
  return GetBloodGlucoseAverageUsecase(ref.watch(bloodGlucoseRepositoryProvider));
});