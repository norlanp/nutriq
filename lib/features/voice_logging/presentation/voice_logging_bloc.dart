import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/voice_logging/domain/entity/voice_food_entry_entity.dart';
import 'package:nutriq/features/voice_logging/domain/usecase/voice_log_usecase.dart';

part 'voice_logging_event.dart';
part 'voice_logging_state.dart';

class VoiceLoggingBloc extends Bloc<VoiceLoggingEvent, VoiceLoggingState> {
  final VoiceLogUsecase _usecase;

  VoiceLoggingBloc(this._usecase) : super(VoiceLoggingInitial()) {
    on<InitializeVoiceLogging>(_onInitialize);
    on<StartListening>(_onStartListening);
    on<StopListening>(_onStopListening);
    on<TranscriptionUpdated>(_onTranscriptionUpdated);
    on<ParseTranscription>(_onParseTranscription);
    on<SelectFoodCandidate>(_onSelectFoodCandidate);
    on<RemoveVoiceEntry>(_onRemoveVoiceEntry);
    on<ConfirmEntries>(_onConfirmEntries);
    on<ResetVoiceLogging>(_onReset);
  }

  Future<void> _onInitialize(
    InitializeVoiceLogging event,
    Emitter<VoiceLoggingState> emit,
  ) async {
    emit(VoiceLoggingInitializing());
    final available = await _usecase.initialize();
    if (available) {
      emit(VoiceLoggingReady(transcription: ''));
    } else {
      emit(
          const VoiceLoggingError(message: 'Speech recognition not available'));
    }
  }

  Future<void> _onStartListening(
    StartListening event,
    Emitter<VoiceLoggingState> emit,
  ) async {
    if (state is VoiceListening) return;
    emit(VoiceListening(transcription: ''));
    try {
      await _usecase.startListening(
        onResult: (text) {
          add(TranscriptionUpdated(text: text));
        },
        onSoundLevelChange: () {},
      );
    } catch (e) {
      emit(VoiceLoggingError(message: e.toString()));
    }
  }

  Future<void> _onStopListening(
    StopListening event,
    Emitter<VoiceLoggingState> emit,
  ) async {
    await _usecase.stopListening();
    final currentTranscription =
        state is VoiceListening ? (state as VoiceListening).transcription : '';
    if (currentTranscription.isNotEmpty) {
      add(ParseTranscription(transcription: currentTranscription));
    } else {
      emit(VoiceLoggingReady(transcription: currentTranscription));
    }
  }

  void _onTranscriptionUpdated(
    TranscriptionUpdated event,
    Emitter<VoiceLoggingState> emit,
  ) {
    if (state is VoiceListening) {
      emit(VoiceListening(transcription: event.text));
    } else if (state is VoiceLoggingReady) {
      emit(VoiceLoggingReady(transcription: event.text));
    }
  }

  Future<void> _onParseTranscription(
    ParseTranscription event,
    Emitter<VoiceLoggingState> emit,
  ) async {
    emit(VoiceLoggingParsing(transcription: event.transcription));

    final entries = _usecase.parseTranscription(event.transcription);
    if (entries.isEmpty) {
      emit(const VoiceLoggingError(message: 'No food items detected'));
      return;
    }

    final results = <VoiceFoodEntryEntity, List<MealEntity>>{};
    for (final entry in entries) {
      final candidates = await _usecase.searchFoodForEntry(entry);
      results[entry] = candidates;
    }

    emit(VoiceLoggingParsed(
      transcription: event.transcription,
      entries: entries,
      foodCandidates: results,
    ));
  }

  void _onSelectFoodCandidate(
    SelectFoodCandidate event,
    Emitter<VoiceLoggingState> emit,
  ) {
    if (state is VoiceLoggingParsed) {
      final current = state as VoiceLoggingParsed;
      final updatedSelections = Map<VoiceFoodEntryEntity, MealEntity>.from(
        current.selectedEntries,
      );
      updatedSelections[event.entry] = event.candidate;
      emit(current.copyWith(selectedEntries: updatedSelections));
    }
  }

  void _onRemoveVoiceEntry(
    RemoveVoiceEntry event,
    Emitter<VoiceLoggingState> emit,
  ) {
    if (state is VoiceLoggingParsed) {
      final current = state as VoiceLoggingParsed;
      final updatedEntries = [...current.entries]..remove(event.entry);
      final updatedCandidates =
          Map<VoiceFoodEntryEntity, List<MealEntity>>.from(
        current.foodCandidates,
      )..remove(event.entry);
      final updatedSelections = Map<VoiceFoodEntryEntity, MealEntity>.from(
        current.selectedEntries,
      )..remove(event.entry);

      if (updatedEntries.isEmpty) {
        emit(VoiceLoggingReady(transcription: current.transcription));
      } else {
        emit(VoiceLoggingParsed(
          transcription: current.transcription,
          entries: updatedEntries,
          foodCandidates: updatedCandidates,
          selectedEntries: updatedSelections,
        ));
      }
    }
  }

  void _onConfirmEntries(
    ConfirmEntries event,
    Emitter<VoiceLoggingState> emit,
  ) {
    if (state is VoiceLoggingParsed) {
      final current = state as VoiceLoggingParsed;
      emit(VoiceLoggingConfirmed(
        selectedEntries: current.selectedEntries,
      ));
    }
  }

  void _onReset(
    ResetVoiceLogging event,
    Emitter<VoiceLoggingState> emit,
  ) {
    _usecase.dispose();
    emit(VoiceLoggingReady(transcription: ''));
  }
}
