import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/articalCategoryProvider.dart';

import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:provider/provider.dart';

Widget articleListWidget(BuildContext context, Article articleData) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  var articleCategoryProvider = Provider.of<ArticleCategoryProvider>(context);

  return Container(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
    // color: Colors.pink,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          articleData.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: deviceWidth * 0.04),
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
                    "${articleCategoryProvider.getCategoryById(articleData.articleCategoryId).categoryName}",
                    // "${Provider.of<AnnouncementCategoryProvider>(context).getCategoryById(articleData.articleCategoryId).categoryName}",
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
                      "${articleData.publisherFullname}",
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
