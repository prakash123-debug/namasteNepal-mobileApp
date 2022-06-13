import 'dart:convert';

import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:namaste_nepal/Utils/server_link.dart';

class SocialWork {
  int id;
  String title;
  int branchId;
  int programCategoryId;
  String programImage;
  String description;
  String publisherFullname;
  int publisherId;
  // String publisherImage;
  DateTime dateTime = new DateTime.now();

  SocialWork({
    required this.id,
    required this.title,
    required this.branchId,
    required this.programCategoryId,
    required this.programImage,
    required this.description,
    required this.publisherFullname,
    required this.publisherId,
    // required this.publisherImage
  });
}

class SocialWorkProvider extends ChangeNotifier {
  List<SocialWork> _socialWork = [
    SocialWork(
        id: 1,
        title: "Rabin Bought a bike",
        branchId: 11,
        programCategoryId: 2,
        programImage:
            "https://images.pexels.com/photos/11765890/pexels-photo-11765890.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        description: "This Bike Belongs to Rabin ",
        publisherFullname: "Prajwal Poudel",
        publisherId: 111),
    SocialWork(
        id: 1,
        title: "Rabin Bought a bike",
        branchId: 11,
        programCategoryId: 2,
        programImage:
            "https://images.pexels.com/photos/9887601/pexels-photo-9887601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        description: "This Bike Belongs to Rabin ",
        publisherFullname: "Prajwal Poudel",
        publisherId: 111),
    SocialWork(
        id: 1,
        title: "Rabin Bought a bike",
        branchId: 11,
        programCategoryId: 2,
        programImage:
            "https://images.pexels.com/photos/12122867/pexels-photo-12122867.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        description: "This Bike Belongs to Rabin ",
        publisherFullname: "Prajwal Poudel",
        publisherId: 111),
    SocialWork(
        id: 1,
        title: "Rabin Bought a bike",
        branchId: 11,
        programCategoryId: 2,
        programImage:
            "https://images.pexels.com/photos/11177218/pexels-photo-11177218.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
        description: "This Bike Belongs to Rabin ",
        publisherFullname: "Prajwal Poudel",
        publisherId: 111),
  ];
  List<SocialWork> get socialWork {
    return [..._socialWork];
  }

  Future getAllProgram() async {
    Uri url = Uri.parse("$link/program");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];

      List<SocialWork> tempHolder = [];
      data.forEach((socialWork) {
        tempHolder.add(SocialWork(
          id: socialWork["id"],
          title: socialWork["title"],
          branchId: socialWork["branchId"],
          programCategoryId: socialWork["programCategoryId"],
          programImage:
              "$imageLink/${socialWork["photos"][0]["programImage"]["fileName"]}",
          description: socialWork["description"],
          publisherFullname: socialWork["organizerUser"]["fullName"],
          publisherId: socialWork["organizerUser"]["id"],
          // publisherImage: announcement["Publisher"]["profilePicture"]
        ));
      });
      // _program = tempHolder;

      print("==================Program");
      print(_socialWork.length);
      print("==================Program");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  SocialWork getProgramById(int id) {
    return _socialWork.where((element) => element.id == id).first;
  }
}
