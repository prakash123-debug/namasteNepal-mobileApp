import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:provider/provider.dart';

Widget announcementListWidget(
    BuildContext context, Announcement announcementData) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
    // color: Colors.pink,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          announcementData.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: deviceWidth * 0.05),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.category,
                  color: Theme.of(context).primaryColor,
                ),
                Padding(
                  padding: EdgeInsets.only(left: deviceWidth * 0.02),
                  child: Text(
                    // "${announcementData.announcementCategoryId}",
                    "${Provider.of<AnnouncementCategoryProvider>(context).getCategoryById(announcementData.announcementCategoryId).categoryName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Theme.of(context).primaryColor),
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: deviceWidth * 0.02),
                    child: Text(
                      "${announcementData.publisherFullname}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
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