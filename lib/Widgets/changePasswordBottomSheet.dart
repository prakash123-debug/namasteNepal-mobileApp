import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/showSnackBarMessage.dart';
import 'package:provider/provider.dart';

changePasswordBottomSheet(BuildContext context) {
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  bool currentPasswordObsecure = true;
  bool newPasswordObsecure = true;
  bool confirmPasswordObsecure = true;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordMatched = true;
  String errMessage = "";
  SnackBarViewer snackBarViewer = new SnackBarViewer();

  showModalBottomSheet(
      elevation: 2,
      context: context,
      builder: (context) => StatefulBuilder(builder: (context, setState) {
            return Container(
              // height: deviceHeight * 0.5,
              width: deviceWidth,
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
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FontAwesomeIcons.close,
                            color: Colors.white,
                          )),
                    ],
                  ),
                  Text(
                    "Change Password",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth * 0.045),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * 0.1),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  passwordMatched = true;
                                });
                              },
                              obscuringCharacter: "*",
                              controller: currentPasswordController,
                              obscureText: currentPasswordObsecure,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  labelText: "Current Password",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          currentPasswordObsecure =
                                              !currentPasswordObsecure;
                                        });
                                      },
                                      icon: Icon(
                                        currentPasswordObsecure
                                            ? MaterialCommunityIcons.eye_outline
                                            : MaterialCommunityIcons
                                                .eye_off_outline,
                                        color: Colors.white,
                                      ))),
                              validator: (value) {
                                if (!passwordMatched) {
                                  return errMessage;
                                }
                                if (value!.isEmpty) {
                                  return "Can't be empty";
                                }
                              },
                            ),
                            TextFormField(
                              controller: newPasswordController,
                              obscuringCharacter: "*",
                              obscureText: newPasswordObsecure,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  labelText: "New Password",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          newPasswordObsecure =
                                              !newPasswordObsecure;
                                        });
                                      },
                                      icon: Icon(
                                        newPasswordObsecure
                                            ? MaterialCommunityIcons.eye_outline
                                            : MaterialCommunityIcons
                                                .eye_off_outline,
                                        color: Colors.white,
                                      ))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Can't be empty";
                                }
                              },
                            ),
                            TextFormField(
                              controller: confirmPasswordController,
                              obscuringCharacter: "*",
                              obscureText: confirmPasswordObsecure,
                              style: TextStyle(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                  labelText: "Confirm New Password",
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          confirmPasswordObsecure =
                                              !confirmPasswordObsecure;
                                        });
                                      },
                                      icon: Icon(
                                        confirmPasswordObsecure
                                            ? MaterialCommunityIcons.eye_outline
                                            : MaterialCommunityIcons
                                                .eye_off_outline,
                                        color: Colors.white,
                                      ))),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Can't be empty";
                                }
                              },
                            ),
                          ],
                        )),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Provider.of<UserProvider>(context, listen: false)
                            .changePasswordInServer(
                                currentPasswordController.text,
                                newPasswordController.text,
                                confirmPasswordController.text)
                            .then((response) {
                          if (response.statusCode == 400) {
                            setState(() {
                              passwordMatched = false;
                              errMessage = response.data["message"];
                            });
                            if (!formKey.currentState!.validate()) {
                              return;
                            }
                          } else {
                            Navigator.pop(context);
                            snackBarViewer.sucessSnackbar(
                                context, response.data["message"]);
                          }
                        }).catchError((err) {
                          Navigator.pop(context);
                          snackBarViewer.errorSnackbar(context, err);
                        });
                      } else {
                        return;
                      }
                    },
                    child: Text("Change Password"),
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all(
                            Size(deviceWidth * 0.5, deviceHeight * 0.05))),
                  )
                ],
              ),
            );
          }));
}
