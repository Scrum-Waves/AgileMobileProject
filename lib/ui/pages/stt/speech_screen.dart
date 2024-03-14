import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';

import '../../../global/constants/routes/routes.dart';
import '../../../Services/speech_to_text/speech_to_text.dart';

class SpeechToTextScreen extends StatefulWidget {
  const SpeechToTextScreen({Key? key}) : super(key: key);

  @override
  State<SpeechToTextScreen> createState() => _SpeechToTextScreenState();
}

class _SpeechToTextScreenState extends State<SpeechToTextScreen> {
  String textSample = 'Click button to start recording';
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Speech Recognition App',
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(Routes.userHomePage);
          },
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await FlutterClipboard.copy(textSample);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Text Copied to Clipboard')),
              );
            },
            icon: const Icon(
              Icons.copy,
            ),
          ),
        ],
      ),
      floatingActionButton: AvatarGlow(
        // Jedidi changed AvatarGlow version
        //endRadius: 80,

        animate: isListening,
        glowColor: Colors.teal,
        child: FloatingActionButton(
          onPressed: toggleRecording,
          child: Icon(
            isListening ? Icons.circle : Icons.mic,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: GestureDetector(
        onTap: () {
          //FocusManager.instance.primaryFocus?.unfocus();
          FocusScope.of(context).unfocus();
        },
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              reverse: true,
              child: Padding(
                  padding: EdgeInsets.all(20.0).copyWith(bottom: 140),
                  child: SelectableText.rich(
                    textAlign: TextAlign.justify,
                    TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            height: 1.5),
                        children: [
                          TextSpan(text: textSample),
                        ]),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  //Function Speech to Text using the service Speech
  Future toggleRecording() => Speech.toggleRecording(
      onResult: (String text) => setState(() {
            textSample = text;
          }),
      onListening: (bool isListening) {
        setState(() {
          this.isListening = isListening;
        });
        /*if (!isListening) {
          Future.delayed(const Duration(milliseconds: 1000), () {
            Utils.scanVoicedText(textSample);
          });
        }*/
      });
}
