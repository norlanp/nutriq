import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/medication_entity.dart';
import 'package:nutriq/core/domain/entity/medication_log_entity.dart';
import 'package:nutriq/features/medication/presentation/notifier/medication_state.dart';
import 'package:nutriq/features/medication/providers/medication_providers.dart';

class MedicationNotifier extends Notifier<MedicationState> {
  @override
  MedicationState build() => const MedicationState();

  Future<void> loadMedications(int userId) async {
    state = MedicationState(isLoading: true);
    try {
      final medications =
          await ref.read(getMedicationsUsecaseProvider).getMedicationsByUserId(userId);
      state = MedicationState(medications: medications);
    } catch (e) {
      state = MedicationState(errorMessage: e.toString());
    }
  }

  Future<void> addMedication(MedicationEntity medication, int userId) async {
    state = MedicationState(isLoading: true, medications: state.medications);
    try {
      await ref.read(addMedicationUsecaseProvider).addMedication(medication);
      final medications =
          await ref.read(getMedicationsUsecaseProvider).getMedicationsByUserId(userId);
      state = MedicationState(medications: medications);
    } catch (e) {
      state = MedicationState(
        medications: state.medications,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> deleteMedication(int medicationId, int userId) async {
    state = MedicationState(isLoading: true, medications: state.medications);
    try {
      await ref.read(deleteMedicationUsecaseProvider).deleteMedication(medicationId);
      final medications =
          await ref.read(getMedicationsUsecaseProvider).getMedicationsByUserId(userId);
      state = MedicationState(medications: medications);
    } catch (e) {
      state = MedicationState(
        medications: state.medications,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logDose(MedicationLogEntity log, DateTime date) async {
    state = MedicationState(isLoading: true, logs: state.logs);
    try {
      await ref.read(logMedicationUsecaseProvider).logMedication(log);
      final logs =
          await ref.read(getMedicationLogUsecaseProvider).getMedicationLogs(date);
      state = MedicationState(logs: logs);
    } catch (e) {
      state = MedicationState(
        logs: state.logs,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadLog(DateTime date) async {
    state = MedicationState(isLoading: true);
    try {
      final logs =
          await ref.read(getMedicationLogUsecaseProvider).getMedicationLogs(date);
      state = MedicationState(logs: logs);
    } catch (e) {
      state = MedicationState(errorMessage: e.toString());
    }
  }
}

final medicationNotifierProvider =
    NotifierProvider<MedicationNotifier, MedicationState>(
        MedicationNotifier.new);