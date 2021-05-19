import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  ArticleView({@required this.articleUrl});
  final String articleUrl;
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  //final Set<String> _favourites = Set<String>();
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
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Icon(Icons.favorite)),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl: widget.articleUrl,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
      // TODO: add a floating action button to controll the webview
      // floatingActionButton: _favouritesButton(),
    );
  }
}
