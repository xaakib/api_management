import 'package:api_management/models/model.dart';
import 'package:api_management/models/source.dart';
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
            height: 150,
            child: FutureBuilder<SourceNews>(
                future: apiServices.getSource(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Sources> list = snapshot.data.sources;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        Sources sources = list[index];

                        return Center(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.red,
                                  ),
                                  child: Center(
                                      child: Text(
                                    sources.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ),
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

                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                          article: data,
                                        )));
                          },
                          leading: data.urlToImage == null
                              ? Text("No Image")
                              : Hero(
                                  tag: data.urlToImage,
                                  child: Image.network(
                                    data.urlToImage,
                                    fit: BoxFit.cover,
                                    height: 80,
                                    width: 80,
                                  ),
                                ),
                          title: data.title == null
                              ? Text("SSSSSSS")
                              : Text(
                                  data.title,
                                ),
                          subtitle: data.description == null
                              ? Text("XXXXXXX")
                              : Text(
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
