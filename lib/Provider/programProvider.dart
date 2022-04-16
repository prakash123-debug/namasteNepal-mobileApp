import 'dart:convert';

import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
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

  Program({
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

class ProgramProvider extends ChangeNotifier {
  List<Program> _program = [];
  List<Program> get program {
    return [..._program];
  }

  Future getAllProgram() async {
    Uri url = Uri.parse("$link/program");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];

      List<Program> tempHolder = [];
      data.forEach((program) {
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
