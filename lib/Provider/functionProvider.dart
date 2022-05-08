import 'package:flutter/foundation.dart';

class FunctionDetail {
  int id;
  String functionName;
  String functionImage;

  FunctionDetail(
      {required this.id,
      required this.functionName,
      required this.functionImage});
}

class FunctionProvider extends ChangeNotifier {
  List<FunctionDetail> _allFunctions = [
    FunctionDetail(
        id: 1,
        functionName: "Namaste Nepal",
        functionImage: "assets/images/logo.png"),
    FunctionDetail(
        id: 2,
        functionName: "Gallery",
        functionImage: "assets/images/gallery.png"),
    FunctionDetail(
        id: 3,
        functionName: "Branches",
        functionImage: "assets/images/branches.png"),
    FunctionDetail(
        id: 4, functionName: "News", functionImage: "assets/images/news.png"),
    FunctionDetail(
        id: 5,
        functionName: "Social Works",
        functionImage: "assets/images/socialWork.png"),
    FunctionDetail(
        id: 6,
        functionName: "Announcement",
        functionImage: "assets/images/hospital.png"),
    FunctionDetail(
        id: 7,
        functionName: "Programs",
        functionImage: "assets/images/socialWork.png"),
    FunctionDetail(
        id: 8,
        functionName: "Article",
        functionImage: "assets/images/socialWork.png"),
  ];

  List<FunctionDetail> get allfunctions {
    return [..._allFunctions];
  }
}
