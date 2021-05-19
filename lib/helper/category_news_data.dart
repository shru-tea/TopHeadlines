import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news_reader/models/category_news.dart';

class CategoryNewsData {
  var _country = 'in';
  var _apiKey = 'ee28f6ea95c44af5964fee9249d68413';
  CategoryNewsData({this.category});
  final String category;
  List<CategoryNewsModel> categoryNews = [];
  var categoryNewsData;

  Future<void> getCategoryNewsData() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=$_country&category=$category&apiKey=$_apiKey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      categoryNewsData = jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }

    if (categoryNewsData['status'] == 'ok') {
      categoryNewsData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          CategoryNewsModel categoryNewsModel = CategoryNewsModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          categoryNews.add(categoryNewsModel);
        }
      });
      //print(news);
    }
  }
}
