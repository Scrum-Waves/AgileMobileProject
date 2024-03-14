import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../global/constants/network/api_keys.dart';


String apiKey = ApiKeys.openAI;

class ApiServices {
  // Jedidi add openAI chatGPT key
  //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
  static String baseUrl = "https://api.openai.com/v1/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey'
  };

  static SendMessage(String? message) async {
    var res = await http.post(Uri.parse(baseUrl),
        headers: header,
        body: jsonEncode({
          "model": "text-davinci-003",
          "prompt": '$message',
          "temperature": 0,
          "max_tokens": 200,
          "top_p": 1,
          "frequency_penalty": 0.0,
          "presence_penalty": 0.0,
          "stop": ["Human:", "AI:"]
        }));

    if (res.statusCode == 200) {
      /*var data = jsonDecode(res.body.toString());*/
      var data = jsonDecode(utf8.decode(res.bodyBytes).toString());
      var msg = data['choices'][0]['text'];
      print(data);
      return msg;
    } else {
      print("Failed to fetch data");
    }
  }
}
