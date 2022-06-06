import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/urlLaunchersFunctions.dart';
import 'package:url_launcher/url_launcher.dart';

Widget footerOfficeDetail(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  SelectColor selectColor = new SelectColor();
  UrlLunchersFunctions urlLunchersFunctions = new UrlLunchersFunctions();
  return Container(
    width: deviceWidth,
    padding: EdgeInsets.symmetric(
        horizontal: deviceWidth * 0.04, vertical: deviceHeight * 0.02),
    height: deviceHeight * 0.45,
    child: Card(
      color: selectColor.cardColor,
      elevation: 3,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.025),
        child: Column(
          children: [
            Text(
              "Namaste Nepal Head Office",
              style: TextStyle(
                  fontSize: deviceWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: selectColor.primaryColor),
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(
                  top: deviceHeight * 0.02, left: deviceWidth * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.locationDot,
                        color: selectColor.primaryColor,
                      ),
                      SizedBox(
                        width: deviceWidth * 0.05,
                      ),
                      Text(
                        "Tilottama-2,Rupandehi,Nepal",
                        style: TextStyle(fontSize: deviceWidth * 0.04),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.phone,
                          color: selectColor.primaryColor),
                      SizedBox(
                        width: deviceWidth * 0.05,
                      ),
                      InkWell(
                        splashColor: selectColor.cardColor,
                        onTap: () {
                          urlLunchersFunctions.makePhoneCall("071-4122333");
                        },
                        child: Text(
                          "071-4122333",
                          style: TextStyle(fontSize: deviceWidth * 0.04),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.envelope,
                          color: selectColor.primaryColor),
                      SizedBox(
                        width: deviceWidth * 0.05,
                      ),
                      InkWell(
                        splashColor: selectColor.cardColor,
                        onTap: () {
                          urlLunchersFunctions
                              .sendMail("namastenepal@gmail.com");
                        },
                        child: Text(
                          "namastenepal@gmail.com",
                          style: TextStyle(fontSize: deviceWidth * 0.04),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(FontAwesomeIcons.globe,
                          color: selectColor.primaryColor),
                      SizedBox(
                        width: deviceWidth * 0.05,
                      ),
                      InkWell(
                        splashColor: selectColor.cardColor,
                        onTap: () {
                          urlLunchersFunctions.openWeb("http://youtube.com");
                        },
                        child: Text(
                          "https://www.namastenepal.com",
                          style: TextStyle(
                              fontSize: deviceWidth * 0.04,
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    ),
  );
}
