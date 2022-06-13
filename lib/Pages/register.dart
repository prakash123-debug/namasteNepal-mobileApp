import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/gallery.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:provider/provider.dart';

import '../Utils/customPageRoute.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final ImagePicker _imagePicker = ImagePicker();
  late File image;
  bool imagePicked = false;
  bool securePassword = true;
  final _formKey = GlobalKey<FormState>();
  static List<String> genders = ["Gender", "Male", "Female", "Other"];
  String selectedGender = genders.first;

  DateTime selectedDate = DateTime.now();
  bool dobSelected = false;
  List<Branch> branches = [];
  Branch? selectedBranch;

  registerHandler(UserProvider userData) {
    userData.gender = selectedGender;
    userData.dateOfBirth = selectedDate;
    userData.profilePic = image;
    userData.branch = selectedBranch;
    print("001");
    if (_formKey.currentState!.validate()) {
      //Server Call

      userData.registerServer().then((value) {
        setState(() {
          imagePicked = false;
        });
      });
      // .catchError((err) {
      //   print(err);
      // });
    } else {
      return;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dobSelected = true;
      });
      print(selectedDate);
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    branches = Provider.of<BranchProvider>(context).branches;
    selectedBranch = branches.first;
    print("First");
    super.didChangeDependencies();
  }

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
                height: deviceHeight,
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    // color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Text(
                      "Register",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: deviceWidth * 0.06),
                    ),
                    // Expanded(
                    //   child:
                    Consumer<UserProvider>(
                        builder: ((context, userData, _) => Container(
                              height: deviceHeight * 0.59,
                              // color: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  vertical: deviceHeight * 0.015),
                              // color: Colors.blue,
                              child: Form(
                                key: _formKey,
                                child: ListView(
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFormField(
                                      controller: userData.fullNameController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          labelText: "FullName",
                                          labelStyle:
                                              TextStyle(color: Colors.grey)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Fullname field can't be empty!";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    TextFormField(
                                      controller:
                                          userData.phoneNumberController,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          labelText: "Phone Number",
                                          labelStyle:
                                              TextStyle(color: Colors.grey)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Phone Number field can't be empty!";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    Container(
                                      // height: deviceHeight * 0.08,
                                      // color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              child:
                                                  DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                ),
                                                iconEnabledColor: Colors.grey,
                                                value: selectedGender,
                                                items:
                                                    genders.map((String items) {
                                                  return DropdownMenuItem(
                                                      value: items,
                                                      child: Text(
                                                        items,
                                                        style: TextStyle(),
                                                      ));
                                                }).toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    selectedGender = value!;
                                                  });
                                                }),
                                          )),
                                          Container(
                                            child: TextButton(
                                                onPressed: () =>
                                                    _selectDate(context),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          right: 8.0),
                                                      child: Icon(
                                                        MaterialCommunityIcons
                                                            .calendar,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                    Text(
                                                      dobSelected
                                                          ? "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"
                                                          : "Date Of Birth",
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    Container(
                                      // height: deviceHeight * 0.08,
                                      // color: Colors.blue,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              child: Row(
                                            children: [
                                              Text(
                                                "Branch: ",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                    ),
                                                    iconEnabledColor:
                                                        Colors.grey,
                                                    value: selectedBranch,
                                                    items: branches
                                                        .map((Branch items) {
                                                      return DropdownMenuItem(
                                                          value: items,
                                                          child: Text(
                                                            "${items.name}",
                                                            style: TextStyle(),
                                                          ));
                                                    }).toList(),
                                                    onChanged: (Branch? value) {
                                                      setState(() {
                                                        selectedBranch = value!;
                                                      });
                                                    }),
                                              ),
                                            ],
                                          )),
                                          InkWell(
                                            onTap: () async {
                                              XFile? selectedImage =
                                                  await _imagePicker.pickImage(
                                                      source:
                                                          ImageSource.gallery);

                                              setState(() {
                                                image =
                                                    File(selectedImage!.path);
                                                imagePicked = true;
                                              });
                                            },
                                            child: DottedBorder(
                                              color: Colors.grey,
                                              child: Container(
                                                  height: deviceHeight * 0.1,
                                                  width: deviceWidth * 0.3,
                                                  child: imagePicked
                                                      ? ClipRRect(
                                                          child: Image.file(
                                                            image,
                                                            fit: BoxFit
                                                                .fitHeight,
                                                          ),
                                                        )
                                                      : Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Icon(
                                                              Icons.upload,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            Text(
                                                              "Profile Picture",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        )
                                                  // TextButton(
                                                  //     onPressed: () =>
                                                  //         _selectDate(context),
                                                  //     child: Row(
                                                  //       children: [
                                                  //         Padding(
                                                  //           padding:
                                                  //               EdgeInsets.only(
                                                  //                   right: 8.0),
                                                  //           child: Icon(
                                                  //             MaterialCommunityIcons
                                                  //                 .calendar,
                                                  //             color: Colors.grey,
                                                  //           ),
                                                  //         ),
                                                  //         Text(
                                                  //           dobSelected
                                                  //               ? "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}"
                                                  //               : "Date Of Birth",
                                                  //           style: TextStyle(
                                                  //               color: Colors.grey),
                                                  //         ),
                                                  //       ],
                                                  //     )),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    TextFormField(
                                      controller: userData.addressController,
                                      keyboardType: TextInputType.streetAddress,
                                      decoration: InputDecoration(
                                          labelText: "Address",
                                          labelStyle:
                                              TextStyle(color: Colors.grey)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Address field can't be empty!";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    TextFormField(
                                      controller: userData.usernameController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          labelText: "Email Address",
                                          labelStyle:
                                              TextStyle(color: Colors.grey)),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Email Address field can't be empty!";
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
                                      height: deviceHeight * 0.02,
                                    ),
                                    TextFormField(
                                      controller:
                                          userData.confirmPasswordController,
                                      keyboardType: TextInputType.text,
                                      obscureText: securePassword,
                                      obscuringCharacter: "*",
                                      decoration: InputDecoration(
                                          labelText: "Confirm Password",
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
                                          return "Confirm Password field can't be empty!";
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.03,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          print("hahahahaha Called");
                                          registerHandler(userData);
                                        },
                                        child: Text(
                                          "Register",
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
                                  ],
                                ),
                              ),
                            ))),
                    // )
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
