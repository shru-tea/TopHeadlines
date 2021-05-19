import 'package:flutter/material.dart';
import 'package:news_reader/helper/category_news_data.dart';
import 'package:news_reader/models/category_news.dart';
import 'package:news_reader/utils/ourBlogTile.dart';

class CategoryNews extends StatefulWidget {
  CategoryNews({@required this.category});
  final String category;

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<CategoryNewsModel> categoryNews = List<CategoryNewsModel>();
  var _loading = true;
  @override
  void initState() {
    super.initState();
    getCategoryNewsData();
  }

  void getCategoryNewsData() async {
    CategoryNewsData categoryNewsData =
        CategoryNewsData(category: widget.category);
    await categoryNewsData.getCategoryNewsData();
    categoryNews = categoryNewsData.categoryNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${widget.category}'),
            Text(
              'Buzz',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Icon(Icons.favorite),
          ),
        ],
      ),
      body: _loading
          ? Container(
              child: Center(
              child: Container(
                child: CircularProgressIndicator(
                  strokeWidth: 4.0,
                ),
              ),
            ))
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 15.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemCount: categoryNews.length,
                        itemBuilder: (context, index) {
                          return OurBlogTile(
                            imageURL: categoryNews[index].urlToImage,
                            blogTitle: categoryNews[index].title,
                            blogDescription: categoryNews[index].description,
                            articleURL: categoryNews[index].url,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
