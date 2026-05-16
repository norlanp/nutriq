import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/features/voice_logging/domain/usecase/voice_log_usecase.dart';

final voiceLogUsecaseProvider = Provider((ref) {
  return VoiceLogUsecase(
    ref.watch(voiceLoggingServiceProvider),
    ref.watch(foodParserServiceProvider),
  );
});