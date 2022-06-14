import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/carouselImageProvider.dart';
import 'package:namaste_nepal/Utils/material_color.dart';
import 'package:provider/provider.dart';

Widget carouselImplement(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  List<CarouselImage> images =
      Provider.of<CarouselImageProvider>(context).images;
  List<String> assetsImages = [
    "assets/images/carousel1.jpg",
    "assets/images/carousel2.jpg",
    "assets/images/carousel3.jpeg"
  ];

  return Container(
    width: deviceWidth,
    height: deviceHeight * 0.3,
    // color: Colors.red,
    child: images.length == 0
        ? CarouselSlider(
            items: assetsImages
                .asMap()
                .entries
                .map((e) => Container(
                    width: deviceWidth,
                    height: deviceHeight * 0.3,
                    child: ClipRRect(
                      child: Image.asset(
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
            ))
        : CarouselSlider(
            items: images
                .asMap()
                .entries
                .map((e) => Container(
                    width: deviceWidth,
                    height: deviceHeight * 0.3,
                    child: ClipRRect(
                      child: Image.network(
                        e.value.imageLink,
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
