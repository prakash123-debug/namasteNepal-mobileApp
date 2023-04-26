import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:namaste_nepal/Provider/programProvider.dart';

import '../Utils/dateConverter.dart';

class ProgramProfile extends StatefulWidget {
  ProgramProfile({Key? key, required Program this.program}) : super(key: key);

  final Program program;

  @override
  State<ProgramProfile> createState() => _ProgramProfileState(program);
}

class _ProgramProfileState extends State<ProgramProfile> {
  _ProgramProfileState(this.program);
  final Program program;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          program.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: deviceWidth * 0.042),
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
                child: CachedNetworkImage(
                  imageUrl: program.programImage,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    // color: Colors.red,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: deviceHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: double.infinity,
                      // color: Colors.red,
                      child: Text(
                        program.title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: deviceWidth * 0.042),
                      )),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),

                  // SizedBox(
                  //   height: deviceHeight * 0.04,
                  // ),
                  Text(
                    "Details:",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: deviceWidth * 0.042,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(
                    color: Colors.grey[500],
                    thickness: 0.7,
                  ),
                  // now here
                  Container(
                    child: HtmlWidget(program.description),
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(

                          // color: Colors.red,
                          child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.calendar,
                            color: Colors.grey[500],
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${dateFormatter(program.dateTime)}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: deviceWidth * 0.03,
                                color: Colors.grey[500]),
                          ),
                        ],
                      )),
                      Container(

                          // color: Colors.red,
                          child: Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.clock,
                            color: Colors.grey[500],
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "${program.time}",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: deviceWidth * 0.03,
                                color: Colors.grey[500]),
                          ),
                        ],
                      )),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.user,
                            color: Colors.grey[500],
                            size: 16,
                          ),
                          SizedBox(width: 10),
                          Text(
                            program.publisherFullname,
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: deviceWidth * 0.03),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
