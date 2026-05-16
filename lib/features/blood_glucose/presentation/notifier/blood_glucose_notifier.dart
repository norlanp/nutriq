import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/blood_glucose_entity.dart';
import 'package:nutriq/features/blood_glucose/presentation/notifier/blood_glucose_state.dart';
import 'package:nutriq/features/blood_glucose/providers/blood_glucose_providers.dart';

class BloodGlucoseNotifier extends Notifier<BloodGlucoseState> {
  @override
  BloodGlucoseState build() => const BloodGlucoseState();

  Future<void> loadEntries(DateTime date) async {
    state = BloodGlucoseState(isLoading: true);
    try {
      final entries = await ref
          .read(getBloodGlucoseUsecaseProvider)
          .getBloodGlucoseByDate(date);
      state = BloodGlucoseState(entries: entries);
    } catch (e) {
      state = BloodGlucoseState(errorMessage: e.toString());
    }
  }

  Future<void> addEntry(BloodGlucoseEntity entry, DateTime date) async {
    state = BloodGlucoseState(isLoading: true, entries: state.entries);
    try {
      await ref.read(addBloodGlucoseUsecaseProvider).addBloodGlucose(entry);
      final entries = await ref
          .read(getBloodGlucoseUsecaseProvider)
          .getBloodGlucoseByDate(date);
      state = BloodGlucoseState(entries: entries);
    } catch (e) {
      state = BloodGlucoseState(
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> deleteEntry(BloodGlucoseEntity entry, DateTime date) async {
    state = BloodGlucoseState(isLoading: true, entries: state.entries);
    try {
      await ref.read(deleteBloodGlucoseUsecaseProvider).deleteBloodGlucose(entry);
      final entries = await ref
          .read(getBloodGlucoseUsecaseProvider)
          .getBloodGlucoseByDate(date);
      state = BloodGlucoseState(entries: entries);
    } catch (e) {
      state = BloodGlucoseState(
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadAverage(DateTime startDate, DateTime endDate) async {
    state = BloodGlucoseState(isLoading: true, entries: state.entries);
    try {
      final average = await ref
          .read(getBloodGlucoseAverageUsecaseProvider)
          .getAverage(startDate, endDate);
      state = BloodGlucoseState(entries: state.entries, average: average);
    } catch (e) {
      state = BloodGlucoseState(
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }
}

final bloodGlucoseNotifierProvider =
    NotifierProvider<BloodGlucoseNotifier, BloodGlucoseState>(
        BloodGlucoseNotifier.new);