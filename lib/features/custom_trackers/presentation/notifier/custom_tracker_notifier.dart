import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entity.dart';
import 'package:nutriq/core/domain/entity/custom_tracker_entry_entity.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/features/custom_tracker/providers/custom_tracker_providers.dart';
import 'package:nutriq/features/custom_trackers/presentation/notifier/custom_tracker_state.dart';

class CustomTrackerNotifier extends Notifier<CustomTrackerState> {
  @override
  CustomTrackerState build() => const CustomTrackerState();

  Future<void> loadTrackers(int userId, {DateTime? date}) async {
    state = const CustomTrackerState(isLoading: true);
    try {
      final trackers = await ref
          .read(customTrackerRepositoryProvider)
          .getTrackersForUser(userId);
      final entries = await ref
          .read(getTrackerEntriesUsecaseProvider)
          .getByDate(date ?? DateTime.now());
      state = CustomTrackerState(trackers: trackers, entries: entries);
    } catch (e) {
      state = CustomTrackerState(errorMessage: e.toString());
    }
  }

  Future<void> createTracker(CustomTrackerEntity entity) async {
    try {
      await ref.read(createCustomTrackerUsecaseProvider).call(entity);
      final trackers = await ref
          .read(customTrackerRepositoryProvider)
          .getTrackersForUser(entity.userId);
      state = CustomTrackerState(
        trackers: trackers,
        entries: state.entries,
      );
    } catch (e) {
      state = CustomTrackerState(
        trackers: state.trackers,
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> deleteTracker(int id) async {
    try {
      await ref.read(deleteCustomTrackerUsecaseProvider).call(id);
      final trackers =
          state.trackers.where((t) => t.id != id).toList();
      state = CustomTrackerState(
        trackers: trackers,
        entries: state.entries,
      );
    } catch (e) {
      state = CustomTrackerState(
        trackers: state.trackers,
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> logEntry(CustomTrackerEntryEntity entity) async {
    try {
      await ref.read(logTrackerEntryUsecaseProvider).call(entity);
      final entries = await ref
          .read(getTrackerEntriesUsecaseProvider)
          .getByDate(entity.date);
      state = CustomTrackerState(
        trackers: state.trackers,
        entries: entries,
      );
    } catch (e) {
      state = CustomTrackerState(
        trackers: state.trackers,
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> loadEntries(DateTime date) async {
    try {
      final entries = await ref
          .read(getTrackerEntriesUsecaseProvider)
          .getByDate(date);
      state = CustomTrackerState(
        trackers: state.trackers,
        entries: entries,
      );
    } catch (e) {
      state = CustomTrackerState(
        trackers: state.trackers,
        entries: state.entries,
        errorMessage: e.toString(),
      );
    }
  }
}

final customTrackerNotifierProvider =
    NotifierProvider<CustomTrackerNotifier, CustomTrackerState>(
        CustomTrackerNotifier.new);