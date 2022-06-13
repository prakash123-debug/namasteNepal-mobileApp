import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';

Widget userProfileBody(BuildContext context, UserDetail userDetail) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  SelectColor selectColor = new SelectColor();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.03),
    child: Column(
      children: [
        ListTile(
          leading: Icon(
            FontAwesomeIcons.user,
            color: selectColor.primaryColor,
          ),
          title: Text(
            userDetail.fullname,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.calendar,
            color: selectColor.primaryColor,
          ),
          title: Text(
            userDetail.dateOfBirth,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.mobile,
            color: selectColor.primaryColor,
          ),
          title: Text(
            userDetail.phone,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.marsAndVenus,
            color: selectColor.primaryColor,
          ),
          title: Text(
            userDetail.gender,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.envelope,
            color: selectColor.primaryColor,
          ),
          title: Text(
            userDetail.email,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
        ListTile(
          leading: Icon(
            FontAwesomeIcons.locationDot,
            color: selectColor.primaryColor,
          ),
          title: Text(
            userDetail.address,
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    ),
  );
}
