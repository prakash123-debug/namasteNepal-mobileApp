import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:provider/provider.dart';

class EditUserDetail extends StatefulWidget {
  EditUserDetail({Key? key, required UserDetail this.userDetail})
      : super(key: key);

  late UserDetail userDetail;

  @override
  State<EditUserDetail> createState() => _EditUserDetailState(userDetail);
}

class _EditUserDetailState extends State<EditUserDetail> {
  _EditUserDetailState(this.userDetail);
  UserDetail userDetail;
  static List<String> genders = ["Gender", "Male", "Female", "Other"];
  final ImagePicker _imagePicker = ImagePicker();
  late File image;
  bool imagePicked = false;

  String selectedGender = genders.first;
  Branch? selectedBranch;
  List<Branch> branches = [];
  DateTime selectedDate = DateTime.now();
  bool dobSelected = false;
  String dateOfBirthDisplay = "";
  String profilePicture = "";
  bool changeProfilePicture = false;

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
        dateOfBirthDisplay =
            "${selectedDate.year}-${selectedDate.month}-${selectedDate.day}";
      });
      print(selectedDate);
    }
  }

  changeCurrentPic(BuildContext context) async {
    // Change Picture
    XFile? selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = File(selectedImage!.path);
      imagePicked = true;
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    branches = Provider.of<BranchProvider>(context).branches;
    selectedBranch =
        Provider.of<BranchProvider>(context).getBranchById(userDetail.branchId);
    print("First");
    Provider.of<UserProvider>(context).editFullNameController.text =
        userDetail.fullname;
    Provider.of<UserProvider>(context).editPhoneNumberController.text =
        userDetail.phone;
    Provider.of<UserProvider>(context).editAddressController.text =
        userDetail.address;
    Provider.of<UserProvider>(context).editUsernameController.text =
        userDetail.email;
    selectedGender = userDetail.gender;
    dateOfBirthDisplay = userDetail.dateOfBirth;
    profilePicture = userDetail.profilePicture;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Stack(
            children: [
              Column(children: [
                // userProfileHeader(context, userDetail),
                Container(
                    width: deviceWidth,
                    height: deviceHeight * 0.2,
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
                    )),
                SizedBox(
                  height: deviceHeight * 0.1,
                ),
                Consumer<UserProvider>(
                  builder: (context, userData, _) => Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * 0.07),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: userData.editFullNameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "FullName",
                                labelStyle: TextStyle(color: Colors.grey)),
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
                            controller: userData.editPhoneNumberController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: "Phone",
                                labelStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Phone field can't be empty!";
                              }
                            },
                          ),
                          SizedBox(
                            height: deviceHeight * 0.02,
                          ),
                          TextFormField(
                            controller: userData.editAddressController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: "Address",
                                labelStyle: TextStyle(color: Colors.grey)),
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
                            controller: userData.editUsernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                labelText: "Email",
                                labelStyle: TextStyle(color: Colors.grey)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email field can't be empty!";
                              }
                            },
                          ),
                          SizedBox(
                            height: deviceHeight * 0.02,
                          ),
                          Container(
                            height: deviceHeight * 0.1,
                            width: deviceWidth,
                            // color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      "Branch: ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          iconEnabledColor: Colors.grey,
                                          value: selectedBranch,
                                          items: branches.map((Branch items) {
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
                                Container(
                                    child: Row(
                                  children: [
                                    Text(
                                      "Gender: ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                          iconEnabledColor: Colors.grey,
                                          value: selectedGender,
                                          items: genders.map((String items) {
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
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Text(
                                  "Date Of Birth: ",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextButton(
                                    onPressed: () => _selectDate(context),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(
                                            MaterialCommunityIcons.calendar,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          dateOfBirthDisplay,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                // userProfileBody(context, userDetail),
                GestureDetector(
                  onTap: () {
                    print("Save");
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
                      "Save",
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
                  left: deviceWidth * 0.02,
                  top: deviceHeight * 0.11,
                  child: imagePicked
                      ? CircleAvatar(
                          radius: deviceHeight * 0.06,
                          backgroundColor: Colors.blue,
                          backgroundImage: FileImage(image))
                      : CircleAvatar(
                          radius: deviceHeight * 0.06,
                          backgroundColor: Colors.blue,
                          backgroundImage: NetworkImage(
                            profilePicture,
                          ),
                        )),
              Positioned(
                  left: deviceWidth * 0.3,
                  top: 0,
                  child: Container(
                    height: deviceHeight * 0.2,
                    width: deviceWidth * 0.7,
                    // color: Colors.pink,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: deviceWidth * 0.02),
                          child: Text(
                            userDetail.fullname,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth * 0.04,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Change Pic
                            changeCurrentPic(context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: deviceWidth * 0.3,
                            height: deviceHeight * 0.05,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                borderRadius:
                                    BorderRadius.circular(deviceWidth * 0.03)),
                            child: Text(
                              "Change Photo",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.01,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: deviceWidth * 0.02),
                          child: Text(
                            userDetail.address,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.01,
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
