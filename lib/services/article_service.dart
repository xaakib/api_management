import 'package:api_management/models/model.dart';
import 'package:api_management/models/source.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  String sourcUrl =
      "https://newsapi.org/v2/sources?apiKey=c5d0829c93794ce3a717ad6f55787aaa";
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=c5d0829c93794ce3a717ad6f55787aaa";
  Future<News> getNews() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      News res = News.fromJson(json.decode(jsonResponse));
      print(res.status);
      return res;
    }
  }

  Future<SourceNews> getSource() async {
    var response = await http.get(sourcUrl);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      SourceNews res = SourceNews.fromJson(json.decode(jsonResponse));

      return res;
    } else {
      print("No data");
    }
  }
}
