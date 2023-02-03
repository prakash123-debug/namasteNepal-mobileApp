import 'dart:convert';

import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:namaste_nepal/Utils/server_link.dart';

class Branch {
  int id;
  String name;
  String address;
  String contactNumber;
  String establishedDate;

  Branch(
      {required this.id,
      required this.name,
      required this.address,
      required this.contactNumber,
      required this.establishedDate});
}

class BranchProvider extends ChangeNotifier {
  List<Branch> _branches = [
    // Branch(
    //     id: 1,
    //     name: "Butwal",
    //     address: "address",
    //     contactNumber: "contactNumber",
    //     establishedDate: "establishedDate")
  ];
  List<Branch> get branches {
    return [..._branches];
  }

  Future getAllBranches() async {
    Uri url = Uri.parse("$link/branch");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];

      List<Branch> tempHolder = [];
      data.forEach((branch) {
        tempHolder.add(Branch(
            id: branch["id"],
            name: branch["name"],
            address: branch["address"],
            contactNumber: branch["contactNumber"],
            establishedDate: branch["establishedDate"]));
      });
      _branches = tempHolder;

      print("==================Branch");
      print(_branches.length);
      print("==================Branch");
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Branch getBranchById(int id) {
    return _branches.where((element) => element.id == id).first;
  }
}
