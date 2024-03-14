import 'dart:convert';

//import 'dart:html' as _html;

import 'package:before_after_image_slider_nullsafty/before_after_image_slider_nullsafty.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Jedidi Add Adapt
//import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:universal_html/html.dart' as _html;
//import 'dart:io';
import 'package:universal_io/io.dart';

//import 'package:screenshot/screenshot.dart';

import '../../../global/constants/routes/routes.dart';
import '../../../services/ai/bg_remover/bg_remover_service.dart';
import '../../../services/ai/bg_remover/bg_remover_web_service.dart';
import '../../widgets/bgRemover/dashBoard.dart';

class BgRemoverScreen extends StatefulWidget {
  const BgRemoverScreen({Key? key}) : super(key: key);

  @override
  State<BgRemoverScreen> createState() => _BgRemoverScreenState();
}

class _BgRemoverScreenState extends State<BgRemoverScreen> {
  var loaded = false;
  var removedBg = false;
  var isLoading = false;

  //Select image from our storage
  Uint8List? image;
  String imagePath = '';

  //web
  Uint8List? webImage = Uint8List(8);
  //Picked img
  XFile? img;

  //Extra screen shot
  /*//Create an instance of ScreenshotController
  ScreenshotController screenshotController = ScreenshotController();*/

  pickImage() async {
    //Android
    if (!kIsWeb) {
      final img = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 100);

      if (img != null) {
        setState(() {
          imagePath = img.path;
          loaded = true;
        });
      } else {
        print("No image has been picked");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      img = await _picker.pickImage(
          source: ImageSource.gallery, imageQuality: 100);
      if (img != null) {
        var f = await img!.readAsBytes();

        setState(() {
          imagePath = img!.path;
          loaded = true;

          webImage = f;
        });
      } else {
        print("No image has been picked");
      }
    }
  }

  //Extra Screenshot
  /*downloadImage() async {
    var perm = await Permission.storage.request();
    var foldername = "BgRemover";
    var filename = "${DateTime.now().millisecondsSinceEpoch}.png";

    if (perm.isGranted) {
      //final directory = await getApplicationDocumentsDirectory();
        //final imagePath = await File('${directory.path}/image.png').create();
        //await imagePath.writeAsBytes(image);

      //final directoryDoc = await getApplicationDocumentsDirectory();
      //final directory = Directory("${directoryDoc.path}");
      //final directory = Directory("storage/emulated/0/");
      final tempDir = await getTemporaryDirectory();
      final directory = Directory("${tempDir.path}");

      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }

      //Extra screenshot
      await screenshotController.captureAndSave(directory.path,
          delay: Duration(milliseconds: 100),
          fileName: filename,
          pixelRatio: 1.0);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Download to ${directory.path}"),
      ));

      final path = '${directory.path}/${filename}';
      await GallerySaver.saveImage(path);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  loaded = false;
                  removedBg = false;
                  isLoading = false;

                  //Select image from our storage
                  image = null;
                  imagePath = '';

                  //web
                  img = null;
                  webImage = null;
                });
              },
              icon: Icon(Icons.refresh)),
          IconButton(
              onPressed: () async {
                if (!kIsWeb) {
                  //// Save screenshot in cache then download to Gallery  V1
                  /*downloadImage();*/
                  // Jedidi Add Adapt
                  // Save Uint8List directly full quality V2
                  //await ImageGallerySaver.saveImage(image!);
                }
                //web
                else if (kIsWeb) {
                  String base64String = base64Encode(image!);
                  String header = "data:image/png;base64";
                  //web download
                  _html.AnchorElement(href: "$header,$base64String")
                    ..setAttribute("download", "file.png")
                    ..click();
                }
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Download success"),
                ));
              },
              icon: Icon(Icons.download))
        ],
        /*leading: Icon(Icons.sort_rounded),*/
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "AI background Remover",
          style: TextStyle(fontSize: 16.0),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () {
            Navigator.of(context).popAndPushNamed(Routes.todo_page);
          },
        ),
      ),
      body: Center(
        child: removedBg
            ? BeforeAfter(
                beforeImage: !kIsWeb
                    ? Image.file(/*dart:io*/ File(imagePath), fit: BoxFit.fill)
                    : Image.memory(webImage!, fit: BoxFit.fill),
                afterImage:
                    //Extra screenshot
                    /*Screenshot(
                    child: */
                    Image.memory(image!, fit: BoxFit.fill),
                /*controller: screenshotController),*/
              )
            : loaded
                ? GestureDetector(
                    onTap: () {
                      pickImage();
                    },
                    child: !kIsWeb
                        ? Image.file(/*dart:io*/ File(imagePath),
                            fit: BoxFit.fill)
                        : Image.memory(webImage!, fit: BoxFit.fill),
                  )
                : DashBoard(
                    padding: EdgeInsets.all(40),
                    color: Colors.grey,
                    radius: 12,
                    child: SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: (Theme.of(context)
                                          .appBarTheme
                                          .backgroundColor ==
                                      Colors.deepPurple)
                                  ? Colors.deepPurpleAccent
                                  : Theme.of(context)
                                      .appBarTheme
                                      .backgroundColor),
                          onPressed: () {
                            pickImage();
                          },
                          child: Text("Pick an image")),
                    ),
                  ),
      ),
      bottomNavigationBar: SizedBox(
        height: 56,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor:
                    (Theme.of(context).appBarTheme.backgroundColor ==
                            Colors.deepPurple)
                        ? Colors.deepPurpleAccent
                        : Theme.of(context).appBarTheme.backgroundColor),
            onPressed: loaded
                ? () async {
                    setState(() {
                      isLoading = true;
                    });
                    !kIsWeb
                        ? image = await BgRemoverService.RemoveBg(imagePath)
                        : image = await BgRemoverWebService.uploadImage(img!);
                    if (image != null) {
                      setState(() {
                        removedBg = true;
                        isLoading = false;
                      });
                    }
                  }
                : null,
            child: isLoading
                ? CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text("Remove Background")),
      ),
    );
  }
}
