import 'package:flutter/material.dart';
import 'package:news_reader/helper/category_data.dart';
import 'package:news_reader/helper/news_data.dart';
import 'package:news_reader/models/blog.dart';
import 'package:news_reader/models/category_names.dart';
import 'package:news_reader/utils/ourBlogTile.dart';
import 'package:news_reader/utils/ourCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = List<CategoryModel>();
  List<BlogModel> blogs = List<BlogModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNewsArticles();
  }

  void getNewsArticles() async {
    NewsData newsData = NewsData();
    await newsData.getNewsData();
    blogs = newsData.news;
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
              Text('Top'),
              Text(
                'Headlines',
                style: TextStyle(color: Colors.red),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? Center(
                child: Container(
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                  ),
                ),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 70.0,
                        child: ListView.builder(
                            itemCount: categories.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return OurCard(
                                imageURL: categories[index].imageURL,
                                categoryName: categories[index].categoryName,
                              );
                            }),
                      ),

                      //for blogs
                      Container(
                        padding: EdgeInsets.only(top: 15.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: blogs.length,
                          itemBuilder: (context, index) {
                            return OurBlogTile(
                              imageURL: blogs[index].urlToImage,
                              blogTitle: blogs[index].title,
                              blogDescription: blogs[index].description,
                              articleURL: blogs[index].url,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
