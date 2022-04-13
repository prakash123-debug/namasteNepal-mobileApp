import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:namaste_nepal/Utils/server_link.dart';
import 'package:http/http.dart' as http;

class Article {
  int id;
  String title;
  int branchId;
  int articleCategoryId;
  String articleImage;
  String description;
  String publisherFullname;
  int publisherId;

  Article(
      {required this.id,
      required this.title,
      required this.branchId,
      required this.articleCategoryId,
      required this.articleImage,
      required this.description,
      required this.publisherFullname,
      required this.publisherId});
}

class ArticleProvider extends ChangeNotifier {
  List<Article> _article = [];

  List<Article> get article {
    return [..._article];
  }

  Future getAllArticle() async {
    Uri url = Uri.parse("$link/article");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      List<Article> tempHolder = [];
      data.forEach((article) => {
            tempHolder.add(Article(
                id: article["id"],
                title: article["title"],
                branchId: article["branchId"],
                articleCategoryId: article["articleCategoryId"],
                articleImage: article["articleImage"]["fileName"],
                description: article["description"],
                publisherFullname: article["Publisher"]["fullName"],
                publisherId: article["userId"]))
          });
      _article = tempHolder;
      print("==================Article");
      print(_article.length);
      print("==================Article");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Article getArticleById(int id) {
    return _article.where((element) => element.id == id).first;
  }
}
