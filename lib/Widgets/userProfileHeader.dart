import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';

Widget userProfileHeader(BuildContext context, UserDetail userDetail) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return Container(
    alignment: Alignment.center,
    height: deviceHeight * 0.25,
    width: deviceWidth,
    decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[
            // Color(0xff1f005c),
            // Color(0xff5b0060),
            // Color(0xff870160),
            // Color(0xffac255e),
            Color(0xffca485c),
            Color(0xffe16b5c),
            Color(0xfff39060),
            Color(0xffffb56b),
          ],
          tileMode: TileMode.mirror,
        ),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(deviceHeight * 0.13),
            bottomRight: Radius.circular(deviceHeight * 0.13))),
    child: Text(
      userDetail.fullname,
      style: TextStyle(
          color: Colors.white,
          fontSize: deviceWidth * 0.07,
          fontStyle: FontStyle.italic),
    ),
  );
}
