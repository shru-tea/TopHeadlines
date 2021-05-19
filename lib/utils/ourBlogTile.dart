import 'package:flutter/material.dart';
import 'package:news_reader/screens/article_view.dart';

class OurBlogTile extends StatelessWidget {
  OurBlogTile(
      {@required this.imageURL,
      @required this.blogTitle,
      @required this.blogDescription,
      @required this.articleURL});
  final String imageURL;
  final String blogTitle;
  final String blogDescription;
  final String articleURL;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleView(
              articleUrl: articleURL,
            ),
          ),
        );
      },
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(6.0),
                child: Image.network(imageURL)),
            SizedBox(
              height: 5.0,
            ),
            Text(
              blogTitle,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              blogDescription,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 18.0,
            )
          ],
        ),
      ),
    );
  }
}
