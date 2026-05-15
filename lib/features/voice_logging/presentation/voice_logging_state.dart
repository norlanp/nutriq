part of 'voice_logging_bloc.dart';

abstract class VoiceLoggingState extends Equatable {
  const VoiceLoggingState();

  @override
  List<Object?> get props => [];
}

class VoiceLoggingInitial extends VoiceLoggingState {
  const VoiceLoggingInitial();
}

class VoiceLoggingInitializing extends VoiceLoggingState {
  const VoiceLoggingInitializing();
}

class VoiceLoggingReady extends VoiceLoggingState {
  final String transcription;

  const VoiceLoggingReady({required this.transcription});

  @override
  List<Object?> get props => [transcription];
}

class VoiceListening extends VoiceLoggingState {
  final String transcription;

  const VoiceListening({required this.transcription});

  @override
  List<Object?> get props => [transcription];
}

class VoiceLoggingParsing extends VoiceLoggingState {
  final String transcription;

  const VoiceLoggingParsing({required this.transcription});

  @override
  List<Object?> get props => [transcription];
}

class VoiceLoggingParsed extends VoiceLoggingState {
  final String transcription;
  final List<VoiceFoodEntryEntity> entries;
  final Map<VoiceFoodEntryEntity, List<MealEntity>> foodCandidates;
  final Map<VoiceFoodEntryEntity, MealEntity> selectedEntries;

  const VoiceLoggingParsed({
    required this.transcription,
    required this.entries,
    required this.foodCandidates,
    this.selectedEntries = const {},
  });

  VoiceLoggingParsed copyWith({
    String? transcription,
    List<VoiceFoodEntryEntity>? entries,
    Map<VoiceFoodEntryEntity, List<MealEntity>>? foodCandidates,
    Map<VoiceFoodEntryEntity, MealEntity>? selectedEntries,
  }) {
    return VoiceLoggingParsed(
      transcription: transcription ?? this.transcription,
      entries: entries ?? this.entries,
      foodCandidates: foodCandidates ?? this.foodCandidates,
      selectedEntries: selectedEntries ?? this.selectedEntries,
    );
  }

  @override
  List<Object?> get props =>
      [transcription, entries, foodCandidates, selectedEntries];
}

class VoiceLoggingConfirmed extends VoiceLoggingState {
  final Map<VoiceFoodEntryEntity, MealEntity> selectedEntries;

  const VoiceLoggingConfirmed({required this.selectedEntries});

  @override
  List<Object?> get props => [selectedEntries];
}

class VoiceLoggingError extends VoiceLoggingState {
  final String message;

  const VoiceLoggingError({required this.message});

  @override
  List<Object?> get props => [message];
}
