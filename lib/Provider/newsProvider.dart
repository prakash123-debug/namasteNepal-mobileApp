import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:namaste_nepal/Utils/server_link.dart';

class News {
  int id;
  String title;
  String date;
  String time;
  String description;
  String newsType;
  String image;

  News(
      {required this.id,
      required this.date,
      required this.title,
      required this.time,
      required this.description,
      required this.newsType,
      required this.image});
}

class NewsProvider extends ChangeNotifier {
  List<News> _news = [];
  //  [
  //   News(
  //       id: 001,
  //       date: "2020-05-11",
  //       title: "News 01",
  //       time: "20:00",
  //       description: "description 001",
  //       newsType: "newsType",
  //       image: "image"),
  //   News(
  //       id: 002,
  //       date: "2020-05-11",
  //       title: "News 02",
  //       time: "20:00",
  //       description: "description 002",
  //       newsType: "newsType",
  //       image: "image"),
  //   News(
  //       id: 003,
  //       date: "2020-05-11",
  //       title: "News 03",
  //       time: "20:00",
  //       description: "description 003",
  //       newsType: "newsType",
  //       image: "image"),
  //   News(
  //       id: 004,
  //       date: "2020-05-11",
  //       title: "News 04",
  //       time: "20:00",
  //       description: "description 004",
  //       newsType: "newsType",
  //       image: "image"),
  //   News(
  //       id: 005,
  //       date: "2020-05-11",
  //       title: "News 05",
  //       time: "20:00",
  //       description: "description 005",
  //       newsType: "newsType",
  //       image: "image"),
  // ];

  List<News> get news {
    return [..._news];
  }

  Future fetchNewsList() async {
    try {
      var url = Uri.parse("$link/news");

      http.Response response = await http.get(url);

      var responseData = jsonDecode(response.body);
      print("++++++++++++++++++=");
      print(responseData["count"]);
      print("++++++++++++++++++");
      List<News> initialNewsList = [];

      if (response.statusCode == 200) {
        responseData["rows"].forEach((newsList) {
          initialNewsList.add(News(
            id: newsList['id'],
            title: newsList['title'],
            description: newsList['description'],
            date: newsList['newsDate'],
            time: newsList['createdAt'],
            newsType: newsList['newsType'],
            image: newsList["newsImage"],
          ));
        });

        _news = initialNewsList;
        print("========+++============");
        print(_news.length);

        print("=======++++============");
      }
      notifyListeners();
    } catch (err) {
      throw err;
    }
  }

  List<News> getNewsByNewsType(String newsType) {
    return _news.where((element) => element.newsType == newsType).toList();
  }
}
