import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:newsapp/models/news_model.dart';
import 'package:newsapp/models/news_details_model.dart';

class Api {
  static String apiNewsString = "api/list.php";
  static String apiDetailNewsString = "api/news.php";
  static String apiDomain = "sarnovosti.ru";

  static Future<List<NewsItem>> getNews(String catId,
      {String from = ""}) async {
    List<NewsItem> data = List.empty();
    try {
      final queryParameters = {
        'from': from,
        'catId': catId,
      };
      var url = Uri.https(Api.apiDomain, Api.apiNewsString, queryParameters);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = (convert.jsonDecode(response.body) as List)
            .map((i) => NewsItem.fromJson(i))
            .toList();
      }
    } finally {}
    return data;
  }

  static Future<NewsItemDetails> getDetailNews(String id) async {
    NewsItemDetails data = NewsItemDetails();
    try {
      final queryParameters = {
        'id': id,
      };
      var url =
          Uri.https(Api.apiDomain, Api.apiDetailNewsString, queryParameters);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> parsed = convert.jsonDecode(response.body);
        data = NewsItemDetails.fromJson(parsed);
      }
    } finally {}
    return data;
  }
}
