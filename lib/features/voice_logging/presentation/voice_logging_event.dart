part of 'voice_logging_bloc.dart';

abstract class VoiceLoggingEvent extends Equatable {
  const VoiceLoggingEvent();

  @override
  List<Object?> get props => [];
}

class InitializeVoiceLogging extends VoiceLoggingEvent {
  const InitializeVoiceLogging();
}

class StartListening extends VoiceLoggingEvent {
  const StartListening();
}

class StopListening extends VoiceLoggingEvent {
  const StopListening();
}

class TranscriptionUpdated extends VoiceLoggingEvent {
  final String text;

  const TranscriptionUpdated({required this.text});

  @override
  List<Object?> get props => [text];
}

class ParseTranscription extends VoiceLoggingEvent {
  final String transcription;

  const ParseTranscription({required this.transcription});

  @override
  List<Object?> get props => [transcription];
}

class SelectFoodCandidate extends VoiceLoggingEvent {
  final VoiceFoodEntryEntity entry;
  final MealEntity candidate;

  const SelectFoodCandidate({required this.entry, required this.candidate});

  @override
  List<Object?> get props => [entry, candidate];
}

class RemoveVoiceEntry extends VoiceLoggingEvent {
  final VoiceFoodEntryEntity entry;

  const RemoveVoiceEntry({required this.entry});

  @override
  List<Object?> get props => [entry];
}

class ConfirmEntries extends VoiceLoggingEvent {
  const ConfirmEntries();
}

class ResetVoiceLogging extends VoiceLoggingEvent {
  const ResetVoiceLogging();
}
