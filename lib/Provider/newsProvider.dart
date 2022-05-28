import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:namaste_nepal/Utils/server_link.dart';

class NewsData {
  int id;
  String title;
  String date;
  String time;
  String description;
  String newsType;
  String image;

  NewsData(
      {required this.id,
      required this.date,
      required this.title,
      required this.time,
      required this.description,
      required this.newsType,
      required this.image});
}

class NewsProvider extends ChangeNotifier {
  List<NewsData> _news = [
    NewsData(
        id: 001,
        date: "2020-05-11",
        title: "News 01",
        time: "20:00",
        description: "description 001",
        newsType: "newsType",
        image: "image"),
    NewsData(
        id: 002,
        date: "2020-05-11",
        title: "News 02",
        time: "20:00",
        description: "description 002",
        newsType: "newsType",
        image: "image"),
    NewsData(
        id: 003,
        date: "2020-05-11",
        title: "News 03",
        time: "20:00",
        description: "description 003",
        newsType: "newsType",
        image: "image"),
    NewsData(
        id: 004,
        date: "2020-05-11",
        title: "News 04",
        time: "20:00",
        description: "description 004",
        newsType: "newsType",
        image: "image"),
    NewsData(
        id: 005,
        date: "2020-05-11",
        title: "News 05",
        time: "20:00",
        description: "description 005",
        newsType: "newsType",
        image: "image"),
  ];

  List<NewsData> get news {
    return [..._news];
  }

  Dio dio = new Dio();

  Future<Response> fetchNewsList() async {
    try {
      Response response = await dio.get("$link/news");

      var responseData = response.data;

      print("++++++++++++++++++=");
      print(responseData);
      print("++++++++++++++++++");
      List<NewsData> initialNewsList = [];

      if (response.statusCode == 200) {
        responseData["data"].forEach((newsList) {
          initialNewsList.add(NewsData(
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
      } else {
        throw "Something Went Wrong !!";
      }
      notifyListeners();
      return response;
    } catch (err) {
      throw err;
    }
  }

  List<NewsData> getNewsByNewsType(String newsType) {
    return _news.where((element) => element.newsType == newsType).toList();
  }
}
