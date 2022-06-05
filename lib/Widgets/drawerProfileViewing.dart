import 'package:flutter/material.dart';
import 'package:namaste_nepal/Pages/login.dart';
import 'package:namaste_nepal/Pages/register.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/material_color.dart';
import 'package:provider/provider.dart';

import '../Utils/customPageRoute.dart';

Widget drawerProfileViewing(
    BuildContext context, bool authorized, UserDetail userDetail) {
  double deviceWeight = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;
  UserDetail userDetail = Provider.of<UserProvider>(context).userData;
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: deviceWeight * 0.02, vertical: deviceHeight * 0.01),
    width: double.infinity,
    height: !authorized ? deviceHeight * 0.2 : deviceHeight * 0.275,
    // color: parseColor("#E6E457"),
    // color: Colors.blue,
    child: !authorized
        ? Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: colorCustom, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(parseColor("#ebebbe")),
                      fixedSize: MaterialStateProperty.all(
                          Size(deviceWeight * 0.4, deviceHeight * 0.02))),
                  onPressed: () {
                    print("Login");
                    // Provider.of<UserProvider>(context, listen: false)
                    //     .UpdateAuthentication(true);
                    Navigator.of(context).push(CustomPageRoute(child: Login()));
                  },
                ),
                ElevatedButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                        color: colorCustom, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(parseColor("#ebebbe")),
                      fixedSize: MaterialStateProperty.all(
                          Size(deviceWeight * 0.4, deviceHeight * 0.02))),
                  onPressed: () {
                    print("Register");
                    Navigator.of(context)
                        .push(CustomPageRoute(child: Register()));
                  },
                ),
              ],
            ),
          )
        : Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: deviceHeight * 0.05,
                  backgroundColor: parseColor("#ebebbe"),
                ),
                // User Detail COntainer
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: deviceHeight * 0.01),
                    // color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          userDetail.fullname,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.005,
                        ),
                        Text(userDetail.email,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: deviceHeight * 0.005,
                        ),
                        Text(userDetail.phone,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: deviceHeight * 0.005,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        splashColor: parseColor("#E6E457"),
                        onTap: () {
                          print("Profile");
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: deviceWeight * 0.01),
                                child: Text(
                                  "Profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: parseColor("#E6E457"),
                        onTap: () {
                          print("Edit");
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: deviceWeight * 0.01),
                                child: Text(
                                  "Edit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: parseColor("#E6E457"),
                        onTap: () {
                          print("Logout/Login");
                          Provider.of<UserProvider>(context, listen: false)
                              .UpdateAuthentication(false);
                        },
                        child: Container(
                          child: Row(
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: deviceWeight * 0.01),
                                child: Text(
                                  "Logout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
  );
}
