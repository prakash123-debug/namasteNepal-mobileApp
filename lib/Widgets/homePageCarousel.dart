import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:namaste_nepal/Utils/material_color.dart';

Widget carouselImplement(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  List<String> images = [
    "https://images.pexels.com/photos/7945340/pexels-photo-7945340.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10346451/pexels-photo-10346451.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10491863/pexels-photo-10491863.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
    "https://images.pexels.com/photos/10488747/pexels-photo-10488747.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
  ];

  return Container(
    width: deviceWidth,
    height: deviceHeight * 0.3,
    // color: Colors.red,
    child: CarouselSlider(
        items: images
            .asMap()
            .entries
            .map((e) => Container(
                width: deviceWidth,
                height: deviceHeight * 0.3,
                child: ClipRRect(
                  child: Image.network(
                    e.value,
                    fit: BoxFit.cover,
                  ),
                )))
            .toList(),
        options: CarouselOptions(
          height: 400,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 10),
          autoPlayAnimationDuration: Duration(milliseconds: 1000),
          autoPlayCurve: Curves.easeIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        )),
  );
}
