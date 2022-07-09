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
  List<CarouselImage> _images = [];

  List<CarouselImage> get images {
    return [..._images];
  }

  Future<Response> getCarouselImageFromServer() async {
    try {
      Response response = await dio.get("$link${Urls().sliderUrl}",
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));

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
