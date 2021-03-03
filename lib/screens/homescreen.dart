import 'package:api_management/models/model.dart';
import 'package:api_management/services/article_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApiManage"),
      ),
      body: FutureBuilder<News>(
          future: apiServices.getNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Article> list = snapshot.data.articles;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  Article data = list[index];
                  return ListTile(
                    title: Text(
                      data.title,
                    ),
                    subtitle: Text(
                      data.description,
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
