import 'dart:convert';

import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:namaste_nepal/Utils/server_link.dart';

class Announcement {
  int id;
  String title;
  int branchId;
  int announcementCategoryId;
  String announcementImage;
  String description;
  String publisherFullname;
  int publisherId;
  // String publisherImage;

  Announcement({
    required this.id,
    required this.title,
    required this.branchId,
    required this.announcementCategoryId,
    required this.announcementImage,
    required this.description,
    required this.publisherFullname,
    required this.publisherId,
    // required this.publisherImage
  });
}

class AnnouncementProvider extends ChangeNotifier {
  List<Announcement> _announcement = [
    // Announcement(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     announcementCategoryId: 2,
    //     announcementImage:
    //         "https://images.pexels.com/photos/11765890/pexels-photo-11765890.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Announcement(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     announcementCategoryId: 2,
    //     announcementImage:
    //         "https://images.pexels.com/photos/9887601/pexels-photo-9887601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Announcement(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     announcementCategoryId: 2,
    //     announcementImage:
    //         "https://images.pexels.com/photos/12122867/pexels-photo-12122867.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Announcement(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     announcementCategoryId: 2,
    //     announcementImage:
    //         "https://images.pexels.com/photos/11177218/pexels-photo-11177218.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
  ];
  List<Announcement> get announcement {
    return [..._announcement];
  }

  Future getAllAnnouncement() async {
    Uri url = Uri.parse("$link/announcement");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];

      List<Announcement> tempHolder = [];
      data.forEach((announcement) {
        tempHolder.add(Announcement(
          id: announcement["id"],
          title: announcement["title"],
          branchId: announcement["branchId"],
          announcementCategoryId: announcement["announcementCategoryId"],
          announcementImage:
              "$imageLink/${announcement["announcementImage"]["fileName"]}",
          description: announcement["description"],
          publisherFullname: announcement["Publisher"]["fullName"],
          publisherId: announcement["userId"],
          // publisherImage: announcement["Publisher"]["profilePicture"]
        ));
      });
      _announcement = tempHolder;

      print("==================Announcement");
      print(_announcement.length);
      print("==================Announcement");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Announcement getAnnouncementById(int id) {
    return _announcement.where((element) => element.id == id).first;
  }
}
