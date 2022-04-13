import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Widgets/listOfTabBar/announcementTabBarList.dart';
import 'package:namaste_nepal/Widgets/listOfTabBar/articleTabBarList.dart';

import 'package:provider/provider.dart';

Widget tabsForCategories({required BuildContext context}) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  List<Announcement> announcement =
      Provider.of<AnnouncementProvider>(context).announcement;
  List<Article> article = Provider.of<ArticleProvider>(context).article;
  List<Map<String, dynamic>> tabsList = [
    {"title": "All", "icon": Icons.list},
    // {"title": "Announcement", "icon": Icons.announcement},
    {"title": "Article", "icon": Icons.article},
    {"title": "Report", "icon": Icons.report},
    {"title": "Program", "icon": Icons.picture_as_pdf_rounded},
  ];
  return DefaultTabController(
    initialIndex: 0,
    length: tabsList.length,
    child: Expanded(
      child: Column(
        children: [
          TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 1.5,
              tabs: tabsList.asMap().entries.map((e) {
                return Tab(
                    // icon: Icon(
                    //   e.value["icon"],
                    //   color: Theme.of(context).primaryColor,
                    // ),
                    child: Text(
                  "${e.value["title"]}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ));
              }).toList()),
          Expanded(
              child: TabBarView(children: [
            // All
            announcement.length == 0
                ? Center(
                    child: Text(
                      "No Activity Found !!",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : ListView.builder(
                    itemCount: announcement.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.01,
                              horizontal: deviceWidth * 0.06),
                          child: showAnnouncementList(
                              context, announcement[index]),
                        )),

            // Article

            article.length == 0
                ? Center(
                    child: Text(
                      "No Article Found !!",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : ListView.builder(
                    itemCount: announcement.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.01,
                              horizontal: deviceWidth * 0.06),
                          child: showArticleList(context, article[index]),
                        )),

            // Report
            announcement.length == 0
                ? Center(
                    child: Text(
                      "No Report Found !!",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : ListView.builder(
                    itemCount: announcement.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.01,
                              horizontal: deviceWidth * 0.06),
                          child: showAnnouncementList(
                              context, announcement[index]),
                        )),

            // Program
            announcement.length == 0
                ? Center(
                    child: Text(
                      "No Program Found !!",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                : ListView.builder(
                    itemCount: announcement.length,
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: deviceHeight * 0.01,
                              horizontal: deviceWidth * 0.06),
                          child: showAnnouncementList(
                              context, announcement[index]),
                        )),
          ]))
        ],
      ),
    ),
  );
}
