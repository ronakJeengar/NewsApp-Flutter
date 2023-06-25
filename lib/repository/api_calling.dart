import 'dart:convert';

import 'package:flutternews/model/article_model.dart';
import 'package:flutternews/repository/class_repository.dart';
import 'package:http/http.dart' as http;

import '../model/article_list_model.dart';

class NewsApiCalling extends ClassRepository{

  var keyApi = "ea71ee155dbf4258a95be818bc276d86";
  var mainUrl = "https://newsapi.org/";
  var apiDomain = "v2/top-headlines?";
  var country = "in&";

  @override
  Future<List<ArticleModel>> getAllNews() async {
    try {
      var url = "$mainUrl${apiDomain}country=${country}apiKey=$keyApi";
      // var url = ("https://newsapi.org/v2/top-headlines?country=in&apiKey=$keyApi");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
        articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        // here shacked number status code
        print("status code#Amer# = ${response.statusCode}");
      }
    } catch (e) {
      print(e);
    }
    throw Exception("here Amer Exception code status");
  }

  @override
  Future<List<ArticleModel>> getCategory(String category) async {
    try {
      var url = "$mainUrl${apiDomain}country=${country}category=$category&apikey=$keyApi";
      // ("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$keyApi");
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesListModel articles = ArticlesListModel.fromMap(jsonData);
        List<ArticleModel> articlesListModel =
        articles.articles!.map((e) => ArticleModel.fromMap(e)).toList();
        return articlesListModel;
      } else {
        // here shacked number status code
        // ignore: avoid_print
        print("status code#Amer# = ${response.statusCode}");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    throw Exception("here Amer Exception code status");
  }

}