import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Utils/htmlParser.dart';

class AnnouncementProfile extends StatefulWidget {
  AnnouncementProfile({Key? key, required Announcement this.announcement})
      : super(key: key);

  final Announcement announcement;

  @override
  State<AnnouncementProfile> createState() =>
      _AnnouncementProfileState(announcement);
}

class _AnnouncementProfileState extends State<AnnouncementProfile> {
  _AnnouncementProfileState(this.announcement);
  final Announcement announcement;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          announcement.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SafeArea(
          child: Container(
        height: deviceHeight,
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.03, vertical: deviceHeight * 0.01),
        child: ListView(
          children: [
            Container(
              height: deviceHeight * 0.3,
              width: deviceWidth,
              child: ClipRRect(
                child: Image.network(
                  announcement.announcementImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: deviceWidth * 0.7,
                      // color: Colors.red,
                      child: Text(
                        announcement.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: deviceWidth * 0.045),
                      )),
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  Container(
                      width: deviceWidth,
                      // color: Colors.red,
                      child: Text(
                        "${announcement.dateTime}",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: deviceWidth * 0.035,
                            color: Colors.grey[500]),
                      )),
                  SizedBox(
                    height: deviceHeight * 0.04,
                  ),
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.user,
                        color: Colors.grey[500],
                      ),
                      SizedBox(width: 10),
                      Text(
                        announcement.publisherFullname,
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: deviceWidth * 0.04),
                      )
                    ],
                  ),

                  SizedBox(
                    height: deviceHeight * 0.04,
                  ),
                  Text(
                    "Details:",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: deviceWidth * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.grey[500],
                    thickness: 0.7,
                  ),
                  // now here
                  Container(
                    child: HtmlWidget(announcement.description),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
