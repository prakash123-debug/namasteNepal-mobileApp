import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Provider/organizationProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/urlLaunchersFunctions.dart';
import 'package:provider/provider.dart';

class NamasteNepal extends StatefulWidget {
  const NamasteNepal({Key? key}) : super(key: key);

  @override
  State<NamasteNepal> createState() => _NamasteNepalState();
}

class _NamasteNepalState extends State<NamasteNepal> {
  UrlLunchersFunctions urlLunchersFunctions = new UrlLunchersFunctions();
  SelectColor selectColor = new SelectColor();
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    OrganizationDetail organizationDetail =
        Provider.of<OrganizationProvider>(context).organizationDetail;
    return Scaffold(
      appBar: AppBar(
        title: Text("Namaste Nepal"),
      ),
      body: SafeArea(
          child: Container(
        height: deviceHeight,
        width: deviceWidth,
        padding: EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.02, vertical: deviceHeight * 0.01),
        child: ListView(
          children: [
            Container(
              height: deviceHeight * 0.3,
              width: deviceWidth,
              child: ClipRRect(
                child: Image.network(
                  organizationDetail.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: deviceHeight * 0.15,
                  width: deviceWidth * 0.4,
                  child: ClipRRect(
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              child: HtmlWidget(organizationDetail.desc),
            ),
            Divider(
              color: Colors.grey,
            ),
            Container(
              height: deviceHeight * 0.07,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            urlLunchersFunctions
                                .openWeb(organizationDetail.fbLink);
                          },
                          icon: Icon(
                            FontAwesomeIcons.facebook,
                            color: selectColor.primaryColor,
                          )),
                      IconButton(
                          onPressed: () {
                            urlLunchersFunctions
                                .openWeb(organizationDetail.instagramLink);
                          },
                          icon: Icon(
                            FontAwesomeIcons.instagramSquare,
                            color: selectColor.primaryColor,
                          )),
                      IconButton(
                          onPressed: () {
                            urlLunchersFunctions
                                .openWeb(organizationDetail.website);
                          },
                          icon: Icon(
                            FontAwesomeIcons.globe,
                            color: selectColor.primaryColor,
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            urlLunchersFunctions
                                .makePhoneCall(organizationDetail.phone);
                          },
                          icon: Icon(
                            FontAwesomeIcons.phone,
                            color: selectColor.primaryColor,
                          )),
                      IconButton(
                          onPressed: () {
                            urlLunchersFunctions
                                .sendMail(organizationDetail.email);
                          },
                          icon: Icon(
                            FontAwesomeIcons.envelope,
                            color: selectColor.primaryColor,
                          )),
                    ],
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
