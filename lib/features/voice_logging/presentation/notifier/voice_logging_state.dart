import 'package:equatable/equatable.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/voice_logging/domain/entity/voice_food_entry_entity.dart';

enum VoiceLoggingStatus {
  initial,
  initializing,
  ready,
  listening,
  parsing,
  parsed,
  confirmed,
  error,
}

class VoiceLoggingState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final VoiceLoggingStatus status;
  final String transcription;
  final List<VoiceFoodEntryEntity> entries;
  final Map<VoiceFoodEntryEntity, List<MealEntity>> foodCandidates;
  final Map<VoiceFoodEntryEntity, MealEntity> selectedEntries;

  const VoiceLoggingState({
    this.isLoading = false,
    this.errorMessage,
    this.status = VoiceLoggingStatus.initial,
    this.transcription = '',
    this.entries = const [],
    this.foodCandidates = const {},
    this.selectedEntries = const {},
  });

  bool get hasError => errorMessage != null;

  VoiceLoggingState copyWith({
    bool? isLoading,
    String? errorMessage,
    VoiceLoggingStatus? status,
    String? transcription,
    List<VoiceFoodEntryEntity>? entries,
    Map<VoiceFoodEntryEntity, List<MealEntity>>? foodCandidates,
    Map<VoiceFoodEntryEntity, MealEntity>? selectedEntries,
  }) {
    return VoiceLoggingState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      status: status ?? this.status,
      transcription: transcription ?? this.transcription,
      entries: entries ?? this.entries,
      foodCandidates: foodCandidates ?? this.foodCandidates,
      selectedEntries: selectedEntries ?? this.selectedEntries,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        status,
        transcription,
        entries,
        foodCandidates,
        selectedEntries,
      ];
}