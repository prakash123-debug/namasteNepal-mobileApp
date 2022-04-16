import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:namaste_nepal/Utils/server_link.dart';
import 'package:http/http.dart' as http;

class ProgramCategory {
  int id;
  String categoryName;
  String description;

  ProgramCategory(
      {required this.id,
      required this.categoryName,
      required this.description});
}

class ProgramCategoryProvider extends ChangeNotifier {
  List<ProgramCategory> _programCategory = [];

  List<ProgramCategory> get programCategory {
    return [..._programCategory];
  }

  // Server Call

  Future getAllprogramCategory() async {
    Uri url = Uri.parse("$link/programcategory");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      List<ProgramCategory> tempHolder = [];
      data.forEach((example) => {
            tempHolder.add(ProgramCategory(
                id: example["id"],
                categoryName: example["categoryName"],
                description: example["description"]))
          });
      _programCategory = tempHolder;
      print("=================programCategory");
      print(_programCategory.length);
      print("=================programCategory");
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  ProgramCategory getCategoryById(int id) {
    return _programCategory.where((element) => element.id == id).first;
  }
}
