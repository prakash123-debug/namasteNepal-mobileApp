import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Widgets/userProfileBody.dart';
import 'package:namaste_nepal/Widgets/userProfileHeader.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  SelectColor selectColor = new SelectColor();
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    UserDetail userDetail = Provider.of<UserProvider>(context).userData;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Stack(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  userProfileHeader(context, userDetail),
                  // SizedBox(
                  //   height: deviceHeight * 0.05,
                  // ),
                  userProfileBody(context, userDetail),
                  GestureDetector(
                    onTap: () {
                      print("Edit Profile");
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: deviceWidth * 0.5,
                      height: deviceHeight * 0.05,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment(0.8, 1),
                            colors: <Color>[
                              // Color(0xff1f005c),
                              // Color(0xff5b0060),
                              // Color(0xff870160),
                              // Color(0xffac255e),
                              Color(0xffca485c),
                              Color(0xffe16b5c),
                              Color(0xfff39060),
                              Color(0xffffb56b),
                            ],
                            tileMode: TileMode.mirror,
                          ),
                          borderRadius:
                              BorderRadius.circular(deviceWidth * 0.03)),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: Colors.white, fontSize: deviceWidth * 0.045),
                      ),
                    ),
                  )
                ]),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
            Positioned(
              left: deviceWidth * 0.36,
              top: deviceHeight * 0.18,
              child: CircleAvatar(
                radius: deviceHeight * 0.06,
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  userDetail.profilePicture,
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
