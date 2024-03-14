import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();

  static initTTS() {
    tts.setLanguage("en-US");
    tts.setPitch(1.0);
    tts.setSpeechRate(0.3);
    //tts.setVolume();
    tts.setStartHandler(() {
      print("TTS IS Started");
    });

    tts.setCompletionHandler(() {
      print("Completed");
    });

    tts.setErrorHandler((message) {
      print(message.toString());
    });
  }

  static speak(String textController) async {
    await tts.awaitSpeakCompletion(true);
    tts.speak(textController);
  }

  static stop() {
    tts.stop();
  }
}
