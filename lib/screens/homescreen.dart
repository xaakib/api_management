import 'package:api_management/models/model.dart';
import 'package:api_management/screens/details_screen.dart';
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
        title: Text("NewsApp"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder<News>(
                future: apiServices.getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Article> list = snapshot.data.articles;

                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        Article data = list[index];
                        String imageLoad = data.urlToImage;

                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          article: data,
                                        )));
                          },
                          leading: imageLoad == null
                              ? Container(
                                  height: 80,
                                  width: 80,
                                  color: Colors.red,
                                )
                              : Hero(
                                  tag: data.urlToImage,
                                  child: Image.network(
                                    data.urlToImage,
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
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
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
        ],
      ),
    );
  }
}
