import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Widgets/announcementListWidget.dart';
import 'package:provider/provider.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    List<Announcement> listOfAnnouncement =
        Provider.of<AnnouncementProvider>(context).announcement;
    return Scaffold(
      // backgroundColor: parseColor("#fafae1"),
      appBar: AppBar(
        title: Text("Announcement"),
      ),
      body: Container(
        // color: Colors.amber,
        child: listOfAnnouncement.length == 0
            ? Center(
                child: Text(
                  "Data Not Found!!",
                  style:
                      TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                ),
              )
            : ListView.builder(
                itemCount: listOfAnnouncement.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.02,
                          horizontal: deviceWidth * 0.04),
                      child: Material(
                        elevation: 2.5,
                        type: MaterialType.card,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                        color: parseColor("#ebebbe"),

                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: deviceWidth * 0.02,
                                vertical: deviceHeight * 0.01),
                            height: deviceHeight * 0.13,
                            child: index % 2 == 0
                                ? Row(
                                    children: [
                                      Container(
                                        width: deviceWidth * 0.2,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            listOfAnnouncement[index]
                                                .announcementImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: announcementListWidget(context,
                                              listOfAnnouncement[index]))
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Expanded(
                                          child: announcementListWidget(context,
                                              listOfAnnouncement[index])),
                                      Container(
                                        width: deviceWidth * 0.2,
                                        decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: Image.network(
                                            listOfAnnouncement[index]
                                                .announcementImage,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                      ),
                    )),
      ),
    );
  }
}
