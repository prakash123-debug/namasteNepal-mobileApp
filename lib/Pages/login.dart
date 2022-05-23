import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:namaste_nepal/Pages/homePage.dart';

import '../Utils/customPageRoute.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool securePassword = true;
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Container(
        height: deviceHeight,
        width: deviceWidth,
        color: Colors.grey,
        child: Stack(
          children: [
            Container(
              height: deviceHeight * 0.4,
              width: deviceWidth,
              child: Stack(
                children: [
                  Container(
                    height: deviceHeight * 0.4,
                    width: deviceWidth,
                    child: ClipRRect(
                        child: Image.asset(
                      "assets/images/butwal.jpg",
                      fit: BoxFit.cover,
                    )),
                  ),
                  Container(
                    height: deviceHeight * 0.4,
                    width: deviceWidth,
                    decoration: BoxDecoration(
                        color: Colors.white
                            // Theme.of(context).primaryColor
                            .withOpacity(0.7)),
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/logo.png",
                        scale: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: deviceHeight * 0.35,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.05,
                    horizontal: deviceWidth * 0.13),
                height: deviceHeight * 0.65,
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 3),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 2))),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 2))),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: deviceWidth * 0.06),
                          ),
                        )),
                    Expanded(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: deviceHeight * 0.05),
                      // color: Colors.blue,
                      child: Form(
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: "Phone/Email",
                                  labelStyle: TextStyle(color: Colors.grey)),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.02,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: securePassword,
                              obscuringCharacter: "*",
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(color: Colors.grey),
                                  suffix: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          securePassword = !securePassword;
                                        });
                                      },
                                      icon: Icon(
                                        securePassword
                                            ? MaterialCommunityIcons.eye_outline
                                            : MaterialCommunityIcons
                                                .eye_off_outline,
                                        color: Colors.grey,
                                      ))),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.01,
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              width: double.infinity,
                              // color: Colors.red,
                              child: GestureDetector(
                                onTap: () {
                                  print("Forget Password");
                                },
                                child: Text(
                                  "Forget Password?",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: deviceHeight * 0.05,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.05,
                                      fontStyle: FontStyle.italic),
                                ),
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(Size(
                                      deviceWidth * 0.3, deviceHeight * 0.05)),
                                )),
                            SizedBox(
                              height: deviceHeight * 0.03,
                            ),
                            GestureDetector(
                              onTap: () {
                                print("Register");
                              },
                              child: Text(
                                "Don't have account? Register",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  // Navigator.of(context).pop(CustomPageRoute(child: HomePage()));
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).primaryColor,
                ))
          ],
        ),
      ),
    )));
  }
}
