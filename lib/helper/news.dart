import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&apiKey=Enter Your Api Id";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == 'ok') {
      jsonData['articles'].forEach((element) {
        if(element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null &&
            element["title"] != null &&
            element["content"] != null
          ) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content'],
          );

          news.add(articleModel);
        }
      });

    }
  }
}

class NewsCategory{
  List<ArticleModel> news = [];

  Future<void> getCategoryNews(String category) async {
    String url = "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=005902bf2a1f461190baff55e52ee35b";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == 'ok') {
      jsonData['articles'].forEach((element) {
        if(element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null &&
            element["title"] != null &&
            element["content"] != null
        ) {
          ArticleModel articleModel = ArticleModel(
            author: element['author'],
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);
        }
      });

    }
  }
}