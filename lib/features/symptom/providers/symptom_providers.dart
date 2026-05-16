import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/usecase/symptom/add_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/delete_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/get_symptoms_usecase.dart';
import 'package:nutriq/core/providers/repository_providers.dart';

final addSymptomUsecaseProvider = Provider((ref) {
  return AddSymptomUsecase(ref.watch(symptomRepositoryProvider));
});

final deleteSymptomUsecaseProvider = Provider((ref) {
  return DeleteSymptomUsecase(ref.watch(symptomRepositoryProvider));
});

final getSymptomsUsecaseProvider = Provider((ref) {
  return GetSymptomsUsecase(ref.watch(symptomRepositoryProvider));
});