import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/symptom_entity.dart';
import 'package:nutriq/features/symptom/providers/symptom_providers.dart';
import 'package:nutriq/features/symptom_tracking/presentation/notifier/symptom_state.dart';

class SymptomNotifier extends Notifier<SymptomState> {
  @override
  SymptomState build() => const SymptomState();

  Future<void> loadSymptoms(DateTime startDate, DateTime endDate) async {
    state = SymptomState(isLoading: true);
    try {
      final symptoms = await ref
          .read(getSymptomsUsecaseProvider)
          .getSymptomsByDateRange(startDate, endDate);
      state = SymptomState(symptoms: symptoms);
    } catch (e) {
      state = SymptomState(errorMessage: e.toString());
    }
  }

  Future<void> addSymptom(
      SymptomEntity symptom, DateTime startDate, DateTime endDate) async {
    state = SymptomState(isLoading: true, symptoms: state.symptoms);
    try {
      await ref.read(addSymptomUsecaseProvider).addSymptom(symptom);
      final symptoms = await ref
          .read(getSymptomsUsecaseProvider)
          .getSymptomsByDateRange(startDate, endDate);
      state = SymptomState(symptoms: symptoms);
    } catch (e) {
      state = SymptomState(symptoms: state.symptoms, errorMessage: e.toString());
    }
  }

  Future<void> deleteSymptom(
      SymptomEntity symptom, DateTime startDate, DateTime endDate) async {
    state = SymptomState(isLoading: true, symptoms: state.symptoms);
    try {
      await ref.read(deleteSymptomUsecaseProvider).deleteSymptom(symptom);
      final symptoms = await ref
          .read(getSymptomsUsecaseProvider)
          .getSymptomsByDateRange(startDate, endDate);
      state = SymptomState(symptoms: symptoms);
    } catch (e) {
      state = SymptomState(symptoms: state.symptoms, errorMessage: e.toString());
    }
  }
}

final symptomNotifierProvider =
    NotifierProvider<SymptomNotifier, SymptomState>(SymptomNotifier.new);