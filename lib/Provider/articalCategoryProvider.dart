import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:namaste_nepal/Utils/server_link.dart';

class ArticleCategory {
  int id;
  String categoryName;
  String categoryDescription;

  ArticleCategory(
      {required this.id,
      required this.categoryName,
      required this.categoryDescription});
}

class ArticleCategoryProvider extends ChangeNotifier {
  List<ArticleCategory> _articleCategory = [];

  List<ArticleCategory> get articleCategory {
    return [..._articleCategory];
  }

  // Server Call

  Future getAllArticleCategory() async {
    Uri url = Uri.parse("$link/articlecategory");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      List<ArticleCategory> tempHolder = [];
      data.forEach((example) => {
            tempHolder.add(ArticleCategory(
                id: example["id"],
                categoryName: example["categoryName"],
                categoryDescription: example["description"]))
          });
      _articleCategory = tempHolder;
      print("=================ArticleCategory");
      print(_articleCategory.length);
      print("=================ArticleCategory");
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  ArticleCategory getCategoryById(int id) {
    return _articleCategory.where((element) => element.id == id).first;
  }
}
