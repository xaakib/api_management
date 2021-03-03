import 'package:api_management/models/model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  String url =
      "http://newsapi.org/v2/everything?q=tesla&from=2021-02-03&sortBy=publishedAt&apiKey=c5d0829c93794ce3a717ad6f55787aaa";

  Future<News> getNews() async {
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = response.body;
      News res = News.fromJson(json.decode(jsonResponse));
      return res;
    }
  }
}
