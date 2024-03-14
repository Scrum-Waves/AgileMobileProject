import 'package:http/http.dart' as http;

class BgRemoverService {
  // flutter add api token
  // hardcoded free access token
  static const apiKey = "vmvf552DzykPZDKCU6bDRhyN";
  static var baseUrl = Uri.parse("https://api.remove.bg/v1.0/removebg");

  static RemoveBg(String imgPath) async {
    var req = http.MultipartRequest("POST", baseUrl);
    req.headers.addAll({"X-API-Key": apiKey});
    req.files.add(await http.MultipartFile.fromPath("image_file", imgPath));
    final res = await req.send();

    if (res.statusCode == 200) {
      http.Response img = await http.Response.fromStream(res);
      return img.bodyBytes;
    } else {
      print("Failed to fetch data");
      return null;
    }
  }
}
