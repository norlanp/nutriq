import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceLoggingService {
  final _log = Logger('VoiceLoggingService');
  final SpeechToText _speechToText = SpeechToText();

  bool _isAvailable = false;
  bool _isListening = false;

  bool get isAvailable => _isAvailable;
  bool get isListening => _isListening;

  Future<bool> initialize() async {
    if (kIsWeb) {
      _isAvailable = false;
      return false;
    }
    _isAvailable = await _speechToText.initialize(
      onError: (error) =>
          _log.warning('Speech recognition error: ${error.errorMsg}'),
      onStatus: (status) => _log.fine('Speech recognition status: $status'),
    );
    return _isAvailable;
  }

  Future<void> startListening({
    required Function(String) onResult,
    required Function() onSoundLevelChange,
  }) async {
    if (!_isAvailable || _isListening) return;

    _isListening = true;
    await _speechToText.listen(
      onResult: (result) {
        onResult(result.recognizedWords);
      },
      onSoundLevelChange: (level) {
        onSoundLevelChange();
      },
      listenOptions: SpeechListenOptions(
        listenMode: ListenMode.dictation,
        cancelOnError: true,
        partialResults: true,
      ),
    );
  }

  Future<void> stopListening() async {
    if (!_isListening) return;
    _isListening = false;
    await _speechToText.stop();
  }

  void dispose() {
    _speechToText.cancel();
    _isListening = false;
  }
}
