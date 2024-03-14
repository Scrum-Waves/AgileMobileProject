import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../global/constants/network/api_keys.dart';

class ApiServices {
  //URL
  static final url = Uri.parse("https://api.openai.com/v1/images/generations");
  //headers
  static final headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer ${ApiKeys.openAI}"
  };
  static GenerateImage(String? message, String? size) async {
    //Create GPT-3 Image model
    const model = "image-alpha-001";

    //Create http post request
    http.Response res = await http.post(
        /*url*/
        Uri.https("api.openai.com", "/v1/images/generations"),
        headers: headers,
        body: json.encode({
          /*"model": model, */ "prompt": message,
          "n": 1,
          "size": size ?? "1024x1024"
        }));

    if (res.statusCode == 200) {
      //decode response
      Map<String, dynamic> responseJson = json.decode(res.body);
      /*jsonDecode(res.body.toString())*/
      String imageUrl = responseJson['data'][0]['url'].toString();
      return imageUrl;
    } else {
      print("Failed to fetch data");
      return "";
    }
  }
}
