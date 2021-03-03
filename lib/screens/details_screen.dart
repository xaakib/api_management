import 'package:api_management/models/model.dart';
import 'package:api_management/screens/webview.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Article article;

  const DetailsScreen({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Details Screen"),
        ),
        body: Column(
          children: [
            Hero(
                tag: article.urlToImage,
                child: Image.network(article.urlToImage)),
            Container(
              height: 100,
              width: 150,
              color: Colors.red,
              child: Center(child: Text(article.source.name)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.content),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.description),
            ),
            RaisedButton(
                child: Text("See More"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WebViewPage(
                                url: article.url,
                              )));
                })
          ],
        ));
  }
}
