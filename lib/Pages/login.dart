import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Utils/showSnackBarMessage.dart';
import 'package:provider/provider.dart';

import '../Utils/customPageRoute.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  SnackBarViewer snackBarViewer = new SnackBarViewer();
  bool isLoading = false;
  bool securePassword = true;
  final _formKey = GlobalKey<FormState>();

  loginHandler(UserProvider userData) {
    print("001");
    if (_formKey.currentState!.validate()) {
      //Server Call
      print("serverCall");
      setState(() {
        isLoading = true;
      });

      userData.loginServer().then((value) {
        setState(() {
          isLoading = false;
        });
        snackBarViewer.sucessSnackbar(context, "Login Sucessful!!");
      }).catchError((err) {
        print(err);
        setState(() {
          isLoading = false;
        });
        snackBarViewer.errorSnackbar(context, err);
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      loading(context);
    } else {
      dismissLoading();
    }
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/logo.png",
                            scale: 4,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: deviceHeight * 0.01),
                          child: Text(
                            "नैतिकवान,विवेकशिल व्यक्तित्व,अबको नेपाल युवाको नेतृत्व",
                            style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: deviceWidth * 0.03,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: deviceHeight * 0.35,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: deviceHeight * 0.01,
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
                    Text(
                      "Login",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: deviceWidth * 0.06),
                    ),
                    Expanded(
                      child: Consumer<UserProvider>(
                          builder: ((context, userData, _) => Container(
                                // color: Colors.blue,
                                padding: EdgeInsets.symmetric(
                                    vertical: deviceHeight * 0.05),
                                // color: Colors.blue,
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      TextFormField(
                                        controller: userData.usernameController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            labelText: "Phone/Email",
                                            labelStyle:
                                                TextStyle(color: Colors.grey)),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Phone/Email field can't be empty!";
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: deviceHeight * 0.02,
                                      ),
                                      TextFormField(
                                        controller: userData.passwordController,
                                        keyboardType: TextInputType.text,
                                        obscureText: securePassword,
                                        obscuringCharacter: "*",
                                        decoration: InputDecoration(
                                            labelText: "Password",
                                            labelStyle:
                                                TextStyle(color: Colors.grey),
                                            suffix: IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    securePassword =
                                                        !securePassword;
                                                  });
                                                },
                                                icon: Icon(
                                                  securePassword
                                                      ? MaterialCommunityIcons
                                                          .eye_outline
                                                      : MaterialCommunityIcons
                                                          .eye_off_outline,
                                                  color: Colors.grey,
                                                ))),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Password field can't be empty!";
                                          }
                                        },
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
                                          onPressed: () {
                                            print("hahahahaha Called");
                                            loginHandler(userData);
                                          },
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontSize: deviceWidth * 0.05,
                                                fontStyle: FontStyle.italic),
                                          ),
                                          style: ButtonStyle(
                                            minimumSize:
                                                MaterialStateProperty.all(Size(
                                                    double.infinity,
                                                    deviceHeight * 0.05)),
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
                              ))),
                    )
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
