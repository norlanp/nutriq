import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/medication/add_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/delete_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medication_log_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medications_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/log_medication_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final addMedicationUsecaseProvider = Provider((ref) {
  return AddMedicationUsecase(ref.watch(medicationRepositoryProvider));
});

final deleteMedicationUsecaseProvider = Provider((ref) {
  return DeleteMedicationUsecase(ref.watch(medicationRepositoryProvider));
});

final logMedicationUsecaseProvider = Provider((ref) {
  return LogMedicationUsecase(ref.watch(medicationRepositoryProvider));
});

final getMedicationLogUsecaseProvider = Provider((ref) {
  return GetMedicationLogUsecase(ref.watch(medicationRepositoryProvider));
});

final getMedicationsUsecaseProvider = Provider((ref) {
  return GetMedicationsUsecase(ref.watch(medicationRepositoryProvider));
});