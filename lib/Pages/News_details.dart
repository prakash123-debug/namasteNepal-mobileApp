import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:namaste_nepal/Utils/server_link.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Utils/dateConverter.dart';

class NewsDetails extends StatefulWidget {
  Map<String, dynamic> arg = {};
  NewsDetails({Key? key, required this.arg}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState(arg);
}

class _NewsDetailsState extends State<NewsDetails> {
  Map<String, dynamic> arg = {};
  _NewsDetailsState(this.arg);

  Future<void> lunchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    // final arg = ModalRoute.of(context)!.settings.arguments as Map;
    final fileType = arg["image"].split(".").last;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          iconSize: deviceWidth * 0.06,
        ),
        title: Text(
          "${arg['title']}",
          style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.043),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: deviceHeight * 0.020, horizontal: deviceWidth * 0.06),
        child: SingleChildScrollView(
          child: Container(
            // height: deviceHeight,
            width: deviceWidth,
            child: Column(
              children: [
                Text(
                  "${arg['title']}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: deviceWidth * 0.045,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${dateFormatter(arg['date'])}",
                      style: TextStyle(
                          fontSize: deviceWidth * 0.03, color: Colors.grey),
                    ),
                    SizedBox(
                      width: deviceWidth * 0.02,
                    ),
                    // Text(
                    //   "${arg['time']}",
                    //   style: TextStyle(
                    //       fontSize: deviceWidth * 0.03, color: Colors.grey),
                    // )
                  ],
                ),
                SizedBox(
                  height: deviceHeight * 0.02,
                ),
                // htmlToWidget("${arg['description']}"),
                HtmlWidget(arg['description']),
                // Text("${arg['description']}"),
                SizedBox(
                  height: deviceHeight * 0.01,
                ),
                Divider(),

                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: fileType != "pdf"
                      ? Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2)),
                          child: CachedNetworkImage(
                            imageUrl: arg['image'],
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              // color: Colors.red,
                            ),
                          ))
                      : ElevatedButton(
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size(deviceWidth, deviceHeight * 0.02))),
                          onPressed: () {
                            lunchInBrowser("$imageLink/${arg['image']}");
                          },
                          child: Text(
                            "PDF(पी.डी.एफ)",
                            style: TextStyle(color: Colors.white),
                          )),
                )
                // Text("view PDF")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
