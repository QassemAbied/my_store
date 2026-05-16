import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText speechToText = SpeechToText();

  bool isInitialized = false;

  Future<void> init() async {
    isInitialized = await speechToText.initialize();
  }

  Future<void> startListening(Function(String) onResult) async {
    if (!isInitialized) {
      await init();
    }

    await speechToText.listen(
      listenMode: ListenMode.confirmation,

      onResult: (result) {
        onResult(result.recognizedWords);
      },
    );
  }

  Future<void> stopListening() async {
    await speechToText.stop();
  }
}
