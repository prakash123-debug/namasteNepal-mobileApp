import 'package:flutter/material.dart';
import 'package:namaste_nepal/Pages/programProfile.dart';
import 'package:namaste_nepal/Pages/socialWorkProfilePage.dart';
import 'package:namaste_nepal/Provider/socialWorkProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/customPageRoute.dart';
import 'package:namaste_nepal/Widgets/programListWidget.dart';
import 'package:namaste_nepal/Widgets/socialWorkListWidget.dart';
import 'package:provider/provider.dart';

class SocialWorks extends StatefulWidget {
  const SocialWorks({Key? key}) : super(key: key);

  @override
  State<SocialWorks> createState() => _SocialWorksState();
}

class _SocialWorksState extends State<SocialWorks> {
  SelectColor selectColor = new SelectColor();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    List<SocialWork> listOfSocialWork =
        Provider.of<SocialWorkProvider>(context).socialWork;
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Work"),
      ),
      body: Container(
        // color: Colors.amber,
        child: listOfSocialWork.length == 0
            ? Center(
                child: Text(
                  "Data Not Found!!",
                  style:
                      TextStyle(color: Colors.red, fontStyle: FontStyle.italic),
                ),
              )
            : ListView.builder(
                itemCount: listOfSocialWork.length,
                itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: deviceHeight * 0.02,
                          horizontal: deviceWidth * 0.04),
                      child: Material(
                        elevation: 2.5,
                        type: MaterialType.card,
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                        color: selectColor.cardColor,

                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                CustomPageRoute(
                                    child: SocialWorkProfile(
                                        socialWork: listOfSocialWork[index])));
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: deviceWidth * 0.001,
                                  vertical: deviceHeight * 0.01),
                              height: deviceHeight * 0.15,
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
                                              listOfSocialWork[index]
                                                  .programImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            child: socialWorkListWidget(context,
                                                listOfSocialWork[index]))
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                            child: socialWorkListWidget(context,
                                                listOfSocialWork[index])),
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
                                              listOfSocialWork[index]
                                                  .programImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )),
                        ),
                      ),
                    )),
      ),
    );
  }
}
