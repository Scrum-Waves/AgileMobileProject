//For web
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class BgRemoverWebService {
  /*static const apiKey = "FJHgW6w97C48efycXaUYcHkU";*/
  static const apiKey = "vmvf552DzykPZDKCU6bDRhyN";
  static String baseUrl = "https://api.remove.bg/v1.0/removebg";

// return Image object of whatever is returned from the bg.remove api
  static uploadImage(XFile image) async {
    var formData = FormData();
    var dio = Dio();
    // flutter add api token
    // hardcoded free access token
    dio.options.headers["X-Api-Key"] = apiKey;
    try {
      //web
      if (kIsWeb) {
        var _bytes = await image.readAsBytes();
        formData.files.add(MapEntry(
          "image_file",
          MultipartFile.fromBytes(_bytes, filename: "pic-name.png"),
        ));
      } else {
        formData.files.add(MapEntry(
          "image_file",
          await MultipartFile.fromFile(image.path, filename: "pic-name.png"),
        ));
      }

      Response<List<int>> response = await dio.post(baseUrl,
          data: formData, options: Options(responseType: ResponseType.bytes));
      return response.data;
    } catch (e) {
      print("Failed to fetch data");
      return null;
    }
  } //image =uploadImage(img);
}
