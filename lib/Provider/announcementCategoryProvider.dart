import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:namaste_nepal/Utils/server_link.dart';

class AnnouncementCategory {
  int id;
  String categoryName;
  String categoryDescription;

  AnnouncementCategory(
      {required this.id,
      required this.categoryName,
      required this.categoryDescription});
}

class AnnouncementCategoryProvider extends ChangeNotifier {
  List<AnnouncementCategory> _announcementCategory = [];

  List<AnnouncementCategory> get announcementCategory {
    return [..._announcementCategory];
  }

  // Server Call

  Future getAllAnnouncementCategory() async {
    Uri url = Uri.parse("$link/announcementCategory");
    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      List<AnnouncementCategory> tempHolder = [];
      data.forEach((example) => {
            tempHolder.add(AnnouncementCategory(
                id: example["id"],
                categoryName: example["categoryName"],
                categoryDescription: example["description"]))
          });
      _announcementCategory = tempHolder;
      print("=================AnnouncementCategory");
      print(_announcementCategory.length);
      print("=================AnnouncementCategory");
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  AnnouncementCategory getCategoryById(int id) {
    return _announcementCategory.where((element) => element.id == id).first;
  }
}
