import 'package:auto_direction/auto_direction.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:share_plus/share_plus.dart';
import 'package:speech_to_text/speech_to_text.dart';

// Jedidi add imports GPT3 chat
import '../../../global/constants/assets/assets_path.dart';
import '../../../global/constants/routes/routes.dart';
import '../../../Services/ai/GPT3/chat/api_services.dart';
import '../../../Services/ai/GPT3/chat/chat_model.dart';
// Jedidi add extra TTS
import '../../../services/text_to_speech/tts.dart';
import '../../../todo/hive_db/data/databse.dart';

import '../../../global/constants/utils/color_palette.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({Key? key}) : super(key: key);

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  //Controller Add text
  TextEditingController controllerQuestion = TextEditingController();
  String _textInput = "";
  //DB begin
  // Jedidi add Reference Box
  final _myBox = Hive.box("SmartDoAI");

  //List of todo tasks
  ToDoDataBase db = ToDoDataBase();
  //DB end

  //String apiKey = "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";

  SpeechToText speechToText = SpeechToText();

  var text = "Hold the button and start speaking";
  var isListening = false;

  // Jedidi add chat messages
  late List<ChatMessage> messages = [];

  // Jedidi add scroll controller
  var scrollController = ScrollController();

  // Jedidi add scroll method
  ScrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            backgroundColor:
                (Theme.of(context).brightness.name == Brightness.light.name)
                    ? Colors.white
                    : Color.fromRGBO(23, 35, 29, 1.0),
            /*floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          endRadius: 110.0,
          animate: isListening,
          duration: Duration(milliseconds: 5000),
          glowColor: bgColor,
          repeat: true,
          repeatPauseDuration: Duration(milliseconds: 100),
          showTwoGlows: true,
          child: GestureDetector(
            onTapDown: (details) async {
              if (!isListening) {
                var available = await speechToText.initialize();
                if (available) {
                  setState(() {
                    isListening = true;
                    speechToText.listen(onResult: (result) {
                      setState(() {
                        text = result.recognizedWords;
                      });
                    });
                  });
                }
              }
              //setState(() {
              //  isListening = true;
              //});
            },
            // Jedidi add async to on tap up
            onTapUp: (details) async {
              setState(() {
                isListening = false;
              });
              // Jedidi add extra await  to speechToText.stop();
              await speechToText.stop();
              // Jedidi add chat messages
              if (text.isNotEmpty &&
                  text != "Hold the button and start speaking") {
                messages
                    .add(ChatMessage(text: text, type: ChatMessageType.user));
                var msg = await ApiServices.SendMessage(text);
                msg = msg.trim();
                setState(() {
                  messages
                      .add(ChatMessage(text: msg, type: ChatMessageType.bot));
                });
                // Jedidi add extra TTS
                Future.delayed(Duration(milliseconds: 500), () {
                  TextToSpeech.speak(msg);
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Failed to process. Try again !")));
              }
            },
            child: CircleAvatar(
              backgroundColor: bgColor,
              radius: 35,
              child: Icon(isListening ? Icons.mic : Icons.mic_none,
                  color: Colors.white),
            ),
          ),
        ),*/
            appBar: AppBar(
              /*automaticallyImplyLeading: false,*/

              leading: IconButton(
                icon: const Icon(Icons.replay_outlined),
                color: Colors.white,
                onPressed: () {
                  setState(() {
                    text = "";
                    messages = [];
                  });
                },
              ),
              actions: [
                /*Padding(
                padding: EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.note_add),
                  color: textColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.todo_page);
                  },
                )),*/
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: IconButton(
                      icon: Icon(Icons.volume_off),
                      color: textColor,
                      onPressed: () {
                        TextToSpeech.stop();
                      },
                    )),
                IconButton(
                  icon: Icon(Icons.note_add),
                  color: textColor,
                  onPressed: () {
                    Navigator.of(context).pushNamed(Routes.todo_page);
                  },
                )
              ],
              centerTitle: true,
              backgroundColor:
                  (Theme.of(context).brightness.name == Brightness.light.name)
                      ? bgColor
                      : Colors.teal,
              elevation: 7.0,
              title: Text("ChatGPT Speaker",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  )),
            ),
            body: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Column(children: [
                  Container(
                      child: Text(
                        text,
                        style: TextStyle(
                            fontSize: 23,
                            color: isListening
                                ? (Theme.of(context).brightness.name ==
                                        Brightness.light.name)
                                    ? Colors.black87
                                    : Colors.white
                                : (Theme.of(context).brightness.name ==
                                        Brightness.light.name)
                                    ? Colors.black54
                                    : Color.fromRGBO(255, 255, 255, 0.8),
                            fontWeight: FontWeight.w600),
                      ),
                      padding: EdgeInsets.only(right: 12, left: 12),
                      margin: const EdgeInsets.only(top: 12)),
                  const SizedBox(height: 12),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                        color: chatBgColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          var chat = messages[index];
                          return chatBubble(
                              chattext: chat.text,
                              type: /*ChatMessageType.user*/ chat.type,
                              index: index,
                              messages: messages);
                        }),
                  )),
                  const SizedBox(height: 5),

                  /*
              const Text("Developed by : jedidi.me",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w400)),*/
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                color: (Theme.of(context).brightness.name ==
                                        Brightness.light.name)
                                    ? Colors.white
                                    : chatBgColor,
                                borderRadius: BorderRadius.circular(30.0),
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(0, 3),
                                      blurRadius: 5,
                                      color:
                                          (Theme.of(context).brightness.name ==
                                                  Brightness.light.name)
                                              ? Colors.grey
                                              : Colors.black45)
                                ],
                              ),
                              child: Row(
                                children: [
                                  IconButton(
                                      icon: Icon(
                                        Icons.paste,
                                        color: (Theme.of(context)
                                                    .brightness
                                                    .name ==
                                                Brightness.light.name)
                                            ? bgColor
                                            : Colors.teal,
                                      ),
                                      onPressed: () {
                                        FlutterClipboard.paste().then((value) =>
                                            controllerQuestion.text = value);
                                      }),
                                  Expanded(
                                    child: AutoDirection(
                                        text: _textInput,
                                        child: TextField(
                                          onChanged: (str) {
                                            setState(() {
                                              _textInput = str;
                                            });
                                          },
                                          controller: controllerQuestion,
                                          decoration: InputDecoration(
                                              hintText: "Type Something...",
                                              hintStyle: TextStyle(
                                                  color: (Theme.of(context)
                                                              .brightness
                                                              .name ==
                                                          Brightness.light.name)
                                                      ? Colors.black54
                                                      : Color.fromRGBO(
                                                          255, 255, 255, 0.8)),
                                              border: InputBorder.none),
                                        )),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.send,
                                        color: (Theme.of(context)
                                                    .brightness
                                                    .name ==
                                                Brightness.light.name)
                                            ? bgColor
                                            : Colors.teal),
                                    onPressed: () async {
                                      setState(() {
                                        _textInput = "Type Something...";
                                      });

                                      TextToSpeech.stop();
                                      // Jedidi add chat messages
                                      if (controllerQuestion.text.toString() !=
                                          "") {
                                        messages.add(ChatMessage(
                                            text: controllerQuestion.text
                                                .toString(),
                                            type: ChatMessageType.user));

                                        //FocusManager.instance.primaryFocus?.unfocus();
                                        FocusScope.of(context).unfocus();
                                        scrollController.jumpTo(
                                          scrollController
                                              .position.maxScrollExtent,
                                        );
                                        String question =
                                            controllerQuestion.text.toString();
                                        controllerQuestion.text = "";
                                        var msg = await ApiServices.SendMessage(
                                            question);

                                        msg = msg.trim();
                                        setState(() {
                                          messages.add(ChatMessage(
                                              text: msg,
                                              type: ChatMessageType.bot));
                                        });

                                        // Jedidi add extra TTS
                                        Future.delayed(
                                            Duration(milliseconds: 500), () {
                                          scrollController.jumpTo(
                                            scrollController
                                                .position.maxScrollExtent,
                                          );
                                          TextToSpeech.speak(msg);
                                        });
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(
                                                    "Failed to process. Try again !")));
                                      }
                                    },
                                  )
                                ],
                              )),
                        ),

                        /*Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration:
                          BoxDecoration(color: bgColor, shape: BoxShape.circle),
                      child: InkWell(
                        child: Icon(
                          Icons.keyboard_voice,
                          color: Colors.white,
                        ),
                        onLongPress: () {},
                      ),
                    )*/

                        AvatarGlow(
                          // Jedidi changed AvatarGlow version
                          //  endRadius: 41.0,
                          animate: isListening,
                          glowColor: bgColor,
                          // Jedidi changed AvatarGlow version
                          //showTwoGlows: true,
                          repeat: true,
                          duration: Duration(milliseconds: 5000),
                          // Jedidi changed AvatarGlow version
                          //repeatPauseDuration: Duration(milliseconds: 100),
                          child: GestureDetector(
                            onTapDown: (details) async {
                              TextToSpeech.stop();
                              if (!isListening) {
                                var available = await speechToText.initialize();
                                if (available) {
                                  setState(() {
                                    isListening = true;
                                    speechToText.listen(onResult: (result) {
                                      setState(() {
                                        text = result.recognizedWords;
                                      });
                                    });
                                  });
                                }
                              }
                              /*setState(() {
                            isListening = true;
                          });*/
                            },
                            // Jedidi add async to on tap up
                            onTapUp: (details) async {
                              //FocusManager.instance.primaryFocus?.unfocus();
                              FocusScope.of(context).unfocus();
                              setState(() {
                                isListening = false;
                              });
                              // Jedidi add extra await  to speechToText.stop();
                              await speechToText.stop();
                              // Jedidi add chat messages
                              if (text.isNotEmpty &&
                                  text !=
                                      "Hold the button and start speaking") {
                                messages.add(ChatMessage(
                                    text: text, type: ChatMessageType.user));
                                scrollController.jumpTo(
                                    scrollController.position.maxScrollExtent);
                                var msg = await ApiServices.SendMessage(text);
                                msg = msg.trim();
                                setState(() {
                                  messages.add(ChatMessage(
                                      text: msg, type: ChatMessageType.bot));
                                });

                                // Jedidi add extra TTS
                                Future.delayed(Duration(milliseconds: 500), () {
                                  scrollController.jumpTo(scrollController
                                      .position.maxScrollExtent);
                                  TextToSpeech.speak(msg);
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Failed to process. Try again !")));
                              }
                            },

                            child: Material(
                              // Replace this child with your own
                              elevation: 8.0,
                              shape: CircleBorder(),
                              child: CircleAvatar(
                                backgroundColor:
                                    (Theme.of(context).brightness.name ==
                                            Brightness.light.name)
                                        ? bgColor
                                        : Colors.teal,
                                radius: 25,
                                child: Icon(
                                    isListening ? Icons.mic : Icons.mic_none,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ]))));
  }

  // Jedidi add chat bubble widget
  Widget chatBubble({
    required chattext,
    required ChatMessageType? type,
    required int? index,
    required List<ChatMessage> messages,
  }) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CircleAvatar(
        backgroundColor: type == ChatMessageType.bot ? Colors.black38 : bgColor,
        child: type == ChatMessageType.bot
            ? GestureDetector(
                onTap: () {
                  saveNote(chattext, messages[((index!) - 1)].text.toString());
                },
                child: Image.asset(
                  Assets.shapeLight,
                  /*Assets.openAI,*/
                  color: Colors.white,
                ))
            : const Icon(
                Icons.person,
                color: Colors.white,
              ),
      ),
      const SizedBox(width: 12),
      Expanded(
          child: Container(
              padding: (type == ChatMessageType.bot)
                  ? EdgeInsets.only(top: 12, right: 12, left: 12)
                  : EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                  color: type == ChatMessageType.bot ? bgColor : Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                      bottomLeft: Radius.circular(12))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoDirection(
                      text: chattext,
                      child: Container(
                          width: double.infinity,
                          child: SelectableText.rich(
                            textAlign: TextAlign.justify,
                            TextSpan(
                                style: TextStyle(
                                  color: type == ChatMessageType.bot
                                      ? Colors.white
                                      : chatBgColor,
                                  fontSize: 15,
                                  fontWeight: type == ChatMessageType.bot
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                ),
                                children: [
                                  TextSpan(text: "$chattext"),
                                ]),
                          )

                          /*Text("$chattext",
                              style: TextStyle(
                                color: type == ChatMessageType.bot
                                    ? Colors.white
                                    : chatBgColor,
                                fontSize: 15,
                                fontWeight: type == ChatMessageType.bot
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                              ))*/
                          )),
                  if (type == ChatMessageType.bot) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            color: textColor,
                            onPressed: () => speak(chattext),
                            icon: Icon(Icons.volume_up),
                          ),
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                color: textColor,
                                onPressed: () => shareText(chattext),
                                icon: Icon(Icons.share),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                color: textColor,
                                onPressed: () => copier(chattext),
                                icon: Icon(Icons.copy),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ]
                ],
              )))
    ]);
  }

  void saveNote(String answer, String question) {
    db.loadData();
    //Add new task
    setState(() {
      db.toDoList.add([
        if (db.toDoList.length == 0)
          0
        else
          db.toDoList.map((e) => e[0]).toList().reduce(
                  (value, element) => value > element ? value : element) +
              1,
        "AI: $question",
        false,
        answer
      ]);

      //Update database
      db.updateDataBase();

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Note saved!')));
    });
  }

  void copier(chattext) {
    FlutterClipboard.copy(chattext).then((value) => print('copied text'));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Text copied to Clipboard!')));
  }

  void shareText(chattext) {
    Share.share(chattext);
  }

  void speak(chattext) {
    Future.delayed(Duration(milliseconds: 500), () {
      TextToSpeech.speak(chattext);
    });
  }
}
/*
chatBubble(
                          chattext: chat.text,
                          type: /*ChatMessageType.user*/ chat.type,
                          /*index: index,
                          messages: messages,*/
                          saveNote: (context) => SaveNote(
                              context,
                              messages[index].text.toString(),
                              messages[((index!) - 1)].text.toString()))
 */
