import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/voice_logging/domain/entity/voice_food_entry_entity.dart';
import 'package:nutriq/features/voice_logging/presentation/notifier/voice_logging_state.dart';
import 'package:nutriq/features/voice_logging/providers/voice_logging_providers.dart';

class VoiceLoggingNotifier extends Notifier<VoiceLoggingState> {
  @override
  VoiceLoggingState build() => const VoiceLoggingState();

  Future<void> initialize() async {
    state = const VoiceLoggingState(status: VoiceLoggingStatus.initializing);
    final available = await ref.read(voiceLogUsecaseProvider).initialize();
    if (available) {
      state = const VoiceLoggingState(status: VoiceLoggingStatus.ready);
    } else {
      state = const VoiceLoggingState(
        status: VoiceLoggingStatus.error,
        errorMessage: 'Speech recognition not available',
      );
    }
  }

  Future<void> startListening() async {
    if (state.status == VoiceLoggingStatus.listening) return;
    state = const VoiceLoggingState(status: VoiceLoggingStatus.listening, transcription: '');
    try {
      await ref.read(voiceLogUsecaseProvider).startListening(
            onResult: (text) {
              updateTranscription(text);
            },
            onSoundLevelChange: () {},
          );
    } catch (e) {
      state = VoiceLoggingState(
        status: VoiceLoggingStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> stopListening() async {
    await ref.read(voiceLogUsecaseProvider).stopListening();
    final currentTranscription =
        state.status == VoiceLoggingStatus.listening ? state.transcription : '';
    if (currentTranscription.isNotEmpty) {
      await parseTranscription(currentTranscription);
    } else {
      state = VoiceLoggingState(
        status: VoiceLoggingStatus.ready,
        transcription: currentTranscription,
      );
    }
  }

  void updateTranscription(String text) {
    if (state.status == VoiceLoggingStatus.listening) {
      state = state.copyWith(transcription: text);
    } else if (state.status == VoiceLoggingStatus.ready) {
      state = VoiceLoggingState(status: VoiceLoggingStatus.ready, transcription: text);
    }
  }

  Future<void> parseTranscription(String transcription) async {
    state = VoiceLoggingState(
      status: VoiceLoggingStatus.parsing,
      transcription: transcription,
    );
    final entries = ref.read(voiceLogUsecaseProvider).parseTranscription(transcription);
    if (entries.isEmpty) {
      state = const VoiceLoggingState(
        status: VoiceLoggingStatus.error,
        errorMessage: 'No food items detected',
      );
      return;
    }

    final results = <VoiceFoodEntryEntity, List<MealEntity>>{};
    for (final entry in entries) {
      final candidates = await ref.read(voiceLogUsecaseProvider).searchFoodForEntry(entry);
      results[entry] = candidates;
    }

    state = VoiceLoggingState(
      status: VoiceLoggingStatus.parsed,
      transcription: transcription,
      entries: entries,
      foodCandidates: results,
    );
  }

  void selectFoodCandidate(VoiceFoodEntryEntity entry, MealEntity candidate) {
    if (state.status == VoiceLoggingStatus.parsed) {
      final updatedSelections = Map<VoiceFoodEntryEntity, MealEntity>.from(
        state.selectedEntries,
      );
      updatedSelections[entry] = candidate;
      state = state.copyWith(selectedEntries: updatedSelections);
    }
  }

  void removeVoiceEntry(VoiceFoodEntryEntity entry) {
    if (state.status == VoiceLoggingStatus.parsed) {
      final updatedEntries = [...state.entries]..remove(entry);
      final updatedCandidates =
          Map<VoiceFoodEntryEntity, List<MealEntity>>.from(state.foodCandidates)
            ..remove(entry);
      final updatedSelections = Map<VoiceFoodEntryEntity, MealEntity>.from(
        state.selectedEntries,
      )..remove(entry);

      if (updatedEntries.isEmpty) {
        state = VoiceLoggingState(
          status: VoiceLoggingStatus.ready,
          transcription: state.transcription,
        );
      } else {
        state = state.copyWith(
          entries: updatedEntries,
          foodCandidates: updatedCandidates,
          selectedEntries: updatedSelections,
        );
      }
    }
  }

  void confirmEntries() {
    if (state.status == VoiceLoggingStatus.parsed) {
      state = VoiceLoggingState(
        status: VoiceLoggingStatus.confirmed,
        selectedEntries: state.selectedEntries,
      );
    }
  }

  void reset() {
    ref.read(voiceLogUsecaseProvider).dispose();
    state = const VoiceLoggingState(status: VoiceLoggingStatus.ready, transcription: '');
  }
}

final voiceLoggingNotifierProvider =
    NotifierProvider<VoiceLoggingNotifier, VoiceLoggingState>(VoiceLoggingNotifier.new);