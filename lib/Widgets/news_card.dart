import 'package:flutter/material.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/news.dart';
import 'package:namaste_nepal/Pages/News_details.dart';
import 'package:namaste_nepal/Provider/newsProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/customPageRoute.dart';

Widget newsCard({required BuildContext context, required NewsData e}) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  SelectColor selectColor = new SelectColor();
  return Padding(
    padding: EdgeInsets.only(bottom: deviceHeight * 0.02),
    child: Container(
      width: deviceWidth,
      height: deviceHeight * 0.1,
      child: Material(
        elevation: 1,
        color: selectColor.cardColor,
        child: MaterialButton(
          splashColor: selectColor.primaryColor,
          onPressed: () {
            // Navigator.pushNamed(context, "/newsdetails", arguments: {
            // "date": e.date,
            // "title": e.title,
            // "time": e.time,
            // "description": e.description,
            // "image": e.image
            // });

            Navigator.of(context).push(CustomPageRoute(
                child: NewsDetails(
              arg: {
                "date": e.date,
                "title": e.title,
                // "time": e.time,
                "description": e.description,
                "image": e.image
              },
            )));

            print("=============================");
            print(e.date);
            print(e.title);

            print("=============================");
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
            child: Column(
              children: [
                Container(
                  child: Row(
                    children: [
                      Text(
                        e.date,
                        style: TextStyle(
                            fontSize: deviceWidth * 0.03, color: Colors.grey),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: deviceWidth * 0.04),
                      //   child: Text(
                      //     e.time,
                      //     style: TextStyle(
                      //         fontSize: deviceWidth * 0.03, color: Colors.grey),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    e.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: deviceWidth * 0.05),
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
