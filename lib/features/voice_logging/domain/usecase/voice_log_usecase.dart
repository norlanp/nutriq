import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/voice_logging/data/food_parser_service.dart';
import 'package:nutriq/features/voice_logging/data/voice_logging_service.dart';
import 'package:nutriq/features/voice_logging/domain/entity/voice_food_entry_entity.dart';

class VoiceLogUsecase {
  final VoiceLoggingService _voiceService;
  final FoodParserService _parserService;

  VoiceLogUsecase(this._voiceService, this._parserService);

  bool get isAvailable => _voiceService.isAvailable;
  bool get isListening => _voiceService.isListening;

  Future<bool> initialize() => _voiceService.initialize();

  Future<void> startListening({
    required Function(String) onResult,
    required Function() onSoundLevelChange,
  }) =>
      _voiceService.startListening(
        onResult: onResult,
        onSoundLevelChange: onSoundLevelChange,
      );

  Future<void> stopListening() => _voiceService.stopListening();

  List<VoiceFoodEntryEntity> parseTranscription(String transcription) =>
      _parserService.parseTranscription(transcription);

  Future<List<MealEntity>> searchFoodForEntry(VoiceFoodEntryEntity entry) =>
      _parserService.searchFoodForEntry(entry);

  void dispose() => _voiceService.dispose();
}
