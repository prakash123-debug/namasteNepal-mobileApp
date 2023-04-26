import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:namaste_nepal/Utils/server_link.dart';

class Gallery {
  String imageUrl;
  Gallery({required this.imageUrl});
}

class GalleryProvider extends ChangeNotifier {
  List<Gallery> _gallery = [
    Gallery(imageUrl: "assets/images/family.jpg"),
    Gallery(imageUrl: "assets/images/carousel1.jpg"),
    Gallery(imageUrl: "assets/images/carousel2.jpg"),
    Gallery(imageUrl: "assets/images/carousel3.jpeg"),
    Gallery(imageUrl: "assets/images/butwal.jpg"),
    // "https://images.pexels.com/photos/10334838/pexels-photo-10334838.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    // Gallery(
    //     imageUrl:
    //         "https://images.pexels.com/photos/11517500/pexels-photo-11517500.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    // Gallery(
    //     imageUrl:
    //         "https://images.pexels.com/photos/11995419/pexels-photo-11995419.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    // Gallery(
    //     imageUrl:
    //         "https://images.pexels.com/photos/11506984/pexels-photo-11506984.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
    // Gallery(
    //     imageUrl:
    //         "https://images.pexels.com/photos/11566128/pexels-photo-11566128.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940")
  ];

  List<Gallery> get gallery {
    return [..._gallery];
  }

  Dio dio = new Dio();

  getGalleryImagesFromServer() async {
    Response response = await dio.get("$link/gallery");
    print("============Gallery");
    print(response.data);
    print("============Gallery");
  }
}
