import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/programCategoryProvider.dart';
import 'package:namaste_nepal/Provider/programProvider.dart';
import 'package:provider/provider.dart';

Widget programListWidget(BuildContext context, Program programData) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  var programCategoryProvider = Provider.of<ProgramCategoryProvider>(context);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
    // color: Colors.pink,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          // color: Colors.red,
          child: Text(
            programData.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: deviceWidth * 0.04),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.category,
                  color: Theme.of(context).primaryColor,
                  size: 16,
                ),
                Padding(
                  padding: EdgeInsets.only(left: deviceWidth * 0.02),
                  child: Text(
                    "${programCategoryProvider.getCategoryById(programData.programCategoryId).categoryName}",
                    // "${Provider.of<ProgramCategoryProvider>(context).getCategoryById(programData.programCategoryId).categoryName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 12),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: deviceWidth * 0.02),
                    child: Text(
                      "${programData.publisherFullname}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
