import 'package:api_management/models/model.dart';
import 'package:api_management/services/article_service.dart';
import 'package:flutter/material.dart';

class ApiManage extends StatefulWidget {
  @override
  _ApiManageState createState() => _ApiManageState();
}

class _ApiManageState extends State<ApiManage> {
  ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ApiManage"),
      ),
      body: FutureBuilder<News>(
          future: _apiServices.getNews(),
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
