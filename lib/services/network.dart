import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper({this.siteURL});
  final String siteURL;

  Future getNews() async {
    http.Response response = await http.get(siteURL);
    if (response.statusCode == 200) {
      var newsData = jsonDecode(response.body);
      return newsData;
    } else {
      print(response.statusCode);
    }
  }
}
