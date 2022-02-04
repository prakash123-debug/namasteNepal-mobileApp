import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:provider/provider.dart';

Widget announcementGridView(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  List<Announcement> announcement =
      Provider.of<AnnouncementProvider>(context).announcement;

  return Container(
    padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.02),
    width: deviceWidth,
    height: announcement.length > 2
        ? deviceHeight * 0.31
        : announcement.length == 0
            ? deviceHeight * 0.1
            : deviceHeight * 0.21,
    // color: Colors.amber,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Announcement",
          style: TextStyle(
              fontSize: deviceWidth * 0.055,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: deviceWidth * 0.02,
        ),
        Expanded(
            child: Container(
          padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
          child: announcement.length == 0
              ? Center(
                  child: Text(
                    "Announcement Not Found",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontStyle: FontStyle.italic),
                  ),
                )
              : GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  padding: EdgeInsets.all(4),
                  childAspectRatio: 2,
                  children: announcement
                      .asMap()
                      .entries
                      .map((e) => Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(deviceWidth * 0.05),
                                ),
                                child: Stack(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            deviceWidth * 0.05),
                                      ),
                                      width: deviceWidth * 0.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            deviceWidth * 0.05),
                                        child: Image.asset(
                                          "assets/images/annBanner.png",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: deviceWidth * 0.4,
                                              alignment: Alignment.center,
                                              child: Text(
                                                "${e.value.title}",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        deviceWidth * 0.04),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                          // Material(
                          //       type: MaterialType.card,
                          //       clipBehavior: Clip.hardEdge,
                          //       color: Theme.of(context).primaryColor,
                          // borderRadius:
                          //     BorderRadius.circular(deviceWidth * 0.06),
                          //       child: Center(
                          // child: Text(
                          //   e.value.title,
                          //   style: TextStyle(
                          //       color: Colors.white,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: deviceWidth * 0.04),
                          // ),
                          //       ),
                          //     )
                          )
                      .toList(),
                ),
        ))
      ],
    ),
  );
}
