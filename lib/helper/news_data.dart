import 'package:news_reader/models/blog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'ee28f6ea95c44af5964fee9249d68413';
const country = 'in';

class NewsData {
  List<BlogModel> news = [];
  var newsData;
  var url =
      'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$apiKey';

  Future<void> getNewsData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      newsData = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }

    if (newsData['status'] == 'ok') {
      newsData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          BlogModel blogModel = BlogModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(blogModel);
        }
      });
      //print(news);
    }
  }
}
