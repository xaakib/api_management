import 'package:api_management/models/model.dart';
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
            Image.network(article.urlToImage),
          ],
        ));
  }
}
