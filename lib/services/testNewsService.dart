import 'dart:convert';

import 'package:api_management/models/model.dart';
import 'package:http/http.dart' as http;
import 'package:api_management/models/test_news.dart';

class ServicesTest {
  static const String url =
      "https://newsapi.org/v2/everything?q=apple&from=2021-03-04&to=2021-03-04&sortBy=popularity&apiKey=c5d0829c93794ce3a717ad6f55787aaa";

  static Future<List<News>> getTestNews() async {
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final NewsTest newsTest = newsTestFromJson(json.decode(response.body));
        return newsTest;
      }
    } catch (e) {}
  }
}
