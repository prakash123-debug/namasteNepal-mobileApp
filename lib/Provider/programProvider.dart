import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:intl/intl.dart';
import 'package:namaste_nepal/Utils/server_link.dart';

class Program {
  int id;
  String title;
  int branchId;
  int programCategoryId;
  String programImage;
  String description;
  String publisherFullname;
  int publisherId;
  // String publisherImage;
  DateTime dateTime;
  String time;

  Program(
      {required this.id,
      required this.title,
      required this.branchId,
      required this.programCategoryId,
      required this.programImage,
      required this.description,
      required this.publisherFullname,
      required this.publisherId,
      required this.dateTime,
      required this.time
      // required this.publisherImage
      });
}

class ProgramProvider extends ChangeNotifier {
  List<Program> _program = [
    // Program(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     programCategoryId: 2,
    //     programImage:
    //         "https://images.pexels.com/photos/11765890/pexels-photo-11765890.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Program(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     programCategoryId: 2,
    //     programImage:
    //         "https://images.pexels.com/photos/9887601/pexels-photo-9887601.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Program(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     programCategoryId: 2,
    //     programImage:
    //         "https://images.pexels.com/photos/12122867/pexels-photo-12122867.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
    // Program(
    //     id: 1,
    //     title: "Rabin Bought a bike",
    //     branchId: 11,
    //     programCategoryId: 2,
    //     programImage:
    //         "https://images.pexels.com/photos/11177218/pexels-photo-11177218.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    //     description: "This Bike Belongs to Rabin ",
    //     publisherFullname: "Prajwal Poudel",
    //     publisherId: 111),
  ];
  List<Program> get program {
    return [..._program];
  }

  Future getAllProgram() async {
    String url = "$link/program";
    try {
      Response response = await Dio().get(url);
      var data = response.data["data"];

      List<Program> tempHolder = [];
      data.forEach((program) {
        DateTime convertedDate =
            DateFormat("yyyy-mm-dd").parse(program["date"]);

        tempHolder.add(Program(
          id: program["id"],
          title: program["title"],
          branchId: program["branchId"],
          programCategoryId: program["programCategoryId"],
          programImage:
              "$imageLink/${program["photos"][0]["programImage"]["fileName"]}",
          description: program["description"],
          publisherFullname: program["organizerUser"]["fullName"],
          publisherId: program["organizerUser"]["id"],
          dateTime: convertedDate,
          time: program["time"],
          // publisherImage: announcement["Publisher"]["profilePicture"]
        ));
      });
      _program = tempHolder;

      print("==================Program");
      print(_program.length);
      print("==================Program");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Program getProgramById(int id) {
    return _program.where((element) => element.id == id).first;
  }
}
