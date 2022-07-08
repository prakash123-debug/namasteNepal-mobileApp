import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Utils/server_link.dart';

class CarouselImage {
  int id;
  String imageLink;
  CarouselImage({required this.id, required this.imageLink});
}

class CarouselImageProvider extends ChangeNotifier {
  Dio dio = new Dio();
  Urls urls = new Urls();
  List<CarouselImage> _images = [
    CarouselImage(id: 1, imageLink: "assets/images/carousel1.jpg"),
    CarouselImage(id: 2, imageLink: "assets/images/carousel2.jpg"),
    CarouselImage(id: 3, imageLink: "assets/images/carousel3.jpg"),
  ];

  List<CarouselImage> get images {
    return [..._images];
  }

  Future<Response> getCarouselImageFromServer() async {
    try {
      Response response = await dio.get("$link${Urls().sliderUrl}");

      List<CarouselImage> tempHolder = [];

      response.data["rows"].forEach((values) {
        values["photos"].forEach((photos) {
          print("=============Slider");
          print(photos);
          print("=============Slider");
          tempHolder.add(CarouselImage(
              id: photos["imageId"],
              imageLink: "$imageLink/${photos["sliderImages"]["fileName"]}"));
        });
      });

      _images = tempHolder;
      notifyListeners();

      return response;
    } catch (err) {
      throw err;
    }
  }
}
