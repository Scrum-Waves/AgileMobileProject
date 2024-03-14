import 'package:flutter/material.dart';

import '../../../global/constants/network/api_keys.dart';

class CreatePost extends StatefulWidget {
  /*String serverIP="Something Wrong";*/
  final String socialMedia;
  CreatePost({
    Key? key,
    required this.socialMedia,
  }) : super(key: key);

  @override
  State<CreatePost> createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  void callEmoji() {
    print('Emoji Icon Pressed...');
  }

  void callAttachFile() {
    print('Attach File Icon Pressed...');
  }

  void callCamera() {
    print('Camera Icon Pressed...');
  }

  void callVoice() {
    print('Voice Icon Pressed...');
  }

  void callEmojii() {
    print('Emoji Icon Pressed...');
  }

  void callAttachFiles() {
    print('Attach File Icon Pressed...');
  }

  Widget moodIcon() {
    return IconButton(
        icon: const Icon(
          Icons.mood,
          color: Color(0xFF00BFA5),
        ),
        onPressed: () => callEmoji());
  }

  Widget voiceIcon() {
    return const Icon(
      Icons.keyboard_voice,
      color: Colors.white,
    );
  }

  Widget attachFile() {
    return IconButton(
      icon: const Icon(Icons.attach_file, color: Color(0xFF00BFA5)),
      onPressed: () => callAttachFile(),
    );
  }

  Widget attachFiles() {
    return IconButton(
      icon: const Icon(Icons.attach_file, color: Color(0xFF00BFA5)),
      onPressed: () => callAttachFile(),
    );
  }

  Widget camera() {
    return IconButton(
      icon: const Icon(Icons.photo_camera, color: Color(0xFF00BFA5)),
      onPressed: () => callCamera(),
    );
  }

  Widget cameras() {
    return IconButton(
      icon: const Icon(Icons.photo_camera, color: Color(0xFF00BFA5)),
      onPressed: () => callCamera(),
    );
  }

  Widget voiceIcons() {
    return const Icon(
      Icons.keyboard_voice,
      color: Colors.white,
    );
  }

  Widget voiceIconss() {
    return const Icon(
      Icons.keyboard_voice,
      color: Colors.white,
    );
  }

  TextEditingController textEditingController = TextEditingController();
  String test = "";

  @override
  initState() {
    super.initState();
    setState(() {
      test = "";
    });
    textEditingController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Generate Post on ${widget.socialMedia}"),
          backgroundColor: Colors.indigoAccent),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12.0),
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(35.0),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 7,
                            color: Colors.grey)
                      ],
                    ),
                    child: Row(
                      children: [
                        moodIcon(),
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                                hintText: "Input post Topic here...",
                                hintStyle: TextStyle(
                                  color: Color.fromARGB(255, 1, 100, 87),
                                  height: 1.4,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                        attachFile(),
                        camera(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                      color: Color(0xFF00BFA5), shape: BoxShape.circle),
                  child: InkWell(
                    child: voiceIcon(),
                    onLongPress: () => callVoice(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: (() async {
                String temp = textEditingController.text.toString();
                String t = "";
                //t = await ApiServicesOpenAI.SendMessage(temp);
                print(t);
                setState(() {
                  //test = t;
                });
              }),
              child: const Text("Generate Post")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: (() async {
              //test
              //await ApiSocialMedia.postFacebook(test, ApiKeys.facebook);
            }),
            child: Text("Publish Post on ${widget.socialMedia}"),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            //width: double.infinity,
            padding: EdgeInsets.all(15.0),
            width: 300.0,
            height: 150.0,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  test,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
