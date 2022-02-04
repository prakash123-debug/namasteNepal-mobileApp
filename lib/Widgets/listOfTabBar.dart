import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:provider/provider.dart';

Widget showAnnouncementList(BuildContext context, Announcement announcement) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  return Material(
    type: MaterialType.card,
    elevation: 1.5,
    color: Colors.white,
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceWidth * 0.02, vertical: deviceHeight * 0.02),
      child: Row(
        children: [
          Container(
            width: deviceWidth * 0.25,
            height: deviceHeight * 0.15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).primaryColor),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                "https://www.simplilearn.com/ice9/free_resources_article_thumb/COVER-IMAGE_Digital-Selling-Foundation-Program.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: deviceWidth * 0.02,
          ),
          Expanded(
              child: Container(
            height: deviceHeight * 0.15,
            // color: Colors.red,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  announcement.title,
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
                            "${Provider.of<AnnouncementCategoryProvider>(context).getCategoryById(announcement.announcementCategoryId).categoryName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
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
                              "${announcement.publisherFullname}",
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
          ))
        ],
      ),
    ),
  );
}
