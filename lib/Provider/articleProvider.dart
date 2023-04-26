import 'dart:convert';

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';

import 'package:namaste_nepal/Provider/articalCategoryProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
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
  DateTime dateTime;

  Article(
      {required this.id,
      required this.title,
      required this.branchId,
      required this.articleCategoryId,
      required this.articleImage,
      required this.description,
      required this.publisherFullname,
      required this.publisherId,
      required this.dateTime});
}

class ArticleProvider extends ChangeNotifier {
  Dio dio = new Dio();
  final storage = new FlutterSecureStorage();
  List<Article> _article = [
    // Article(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     articleCategoryId: 2,
    //     articleImage:
    //         "https://images.pexels.com/photos/11765890/pexels-photo-11765890.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Article(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     articleCategoryId: 2,
    //     articleImage:
    //         "https://images.pexels.com/photos/9887601/pexels-photo-9887601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Article(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     articleCategoryId: 2,
    //     articleImage:
    //         "https://images.pexels.com/photos/12122867/pexels-photo-12122867.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Article(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     articleCategoryId: 2,
    //     articleImage:
    //         "https://images.pexels.com/photos/11177218/pexels-photo-11177218.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
  ];

  List<Article> get article {
    return [..._article];
  }

  Future getAllArticle() async {
    Uri url = Uri.parse("$link/article");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      List<Article> tempHolder = [];
      DateTime convertedDate;
      data.forEach((article) {
        convertedDate = DateFormat("yyyy-mm-dd").parse(article["date"]);
        print(convertedDate);
        tempHolder.add(Article(
            id: article["id"],
            title: article["title"],
            branchId: article["branchId"],
            articleCategoryId: article["articleCategoryId"],
            articleImage: "$imageLink/${article["articleImage"]["fileName"]}",
            description: article["description"],
            publisherFullname: article["Publisher"]["fullName"],
            publisherId: article["userId"],
            dateTime: convertedDate));
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

  Future<Response> addArticleToServer(
      {required String articleTitle,
      required Branch branch,
      required String date,
      required ArticleCategory articleCategory,
      required String description,
      required File image}) async {
    try {
      String? token = await storage.read(key: tokenKey);
      int uploadImage = await uploadImageOnServer(image);
      // var formData = FormData.fromMap({
      //   "title": articleTitle,
      //   "articleCategoryId": articleCategory.id,
      //   "branchId": branch.id,
      //   "date": date,
      //   "articleImageId": uploadImage,
      //   "description": description
      // });

      Response response = await dio.post("$link/article",
          data: {
            "title": articleTitle,
            "articleCategoryId": articleCategory.id,
            "branchId": branch.id,
            "date": date,
            "articleImageId": uploadImage,
            "description": description
          },
          options: Options(
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
              headers: {"Authorization": "Bearer $token"}));
      print(response.data);
      if (response.statusCode == 201) {
      } else {
        throw "Something Went Wrong";
      }
      return response;
    } catch (err) {
      throw err;
    }
  }

  // Send Article Pic to server

  Future<int> uploadImageOnServer(File image) async {
    try {
      FormData picture = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.split("/").last,
            contentType: new MediaType("image", "jpeg")),
      });

      Response imageResponse = await dio.post("$link/file/single",
          data: picture,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      print(imageResponse.data);
      print(imageResponse.statusCode);
      return imageResponse.data["file"]["id"];
    } catch (err) {
      throw err;
    }
  }

  Article getArticleById(int id) {
    return _article.where((element) => element.id == id).first;
  }
}
