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
  List<CarouselImage> _images = [
    // CarouselImage(
    //     id: 1,
    //     imageLink:
    //         "https://images.pexels.com/photos/7945340/pexels-photo-7945340.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    // CarouselImage(
    //     id: 2,
    //     imageLink:
    //         "https://images.pexels.com/photos/10346451/pexels-photo-10346451.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    // CarouselImage(
    //     id: 3,
    //     imageLink:
    //         "https://images.pexels.com/photos/10491863/pexels-photo-10491863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
    // CarouselImage(
    //     id: 4,
    //     imageLink:
    //         'https://images.pexels.com/photos/10488747/pexels-photo-10488747.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500')
  ];
  List<CarouselImage> get images {
    return [..._images];
  }

  Future<Response> getCarouselImageFromServer() async {
    try {
      Response response = await dio.get("$link/slider");
      print("=============Slider");
      print(response.data);
      print("=============Slider");
      return response;
    } catch (err) {
      throw err;
    }
  }
}
