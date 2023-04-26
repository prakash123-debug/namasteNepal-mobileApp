import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:namaste_nepal/Provider/articalCategoryProvider.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Utils/showSnackBarMessage.dart';
import 'package:provider/provider.dart';

import '../Utils/dateConverter.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  SelectColor selectColor = new SelectColor();
  String htmlText = "";
  HtmlEditorController controller = HtmlEditorController();
  Branch? selectedBranch;
  bool dateSelected = false;
  DateTime selectedDate = DateTime.now();
  List<Branch> branches = [];
  List<ArticleCategory> articleCategories = [];
  ArticleCategory? selectedArticleCategory;
  final ImagePicker _imagePicker = ImagePicker();
  late File image;
  bool imagePicked = false;
  TextEditingController articleTitleController = TextEditingController();
  bool isLoading = false;
  SnackBarViewer snackBarViewer = new SnackBarViewer();
  GlobalKey<FormState> _globalFormKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateSelected = true;
      });
      print(selectedDate);
    }
  }

  addArticleHandler() async {
    htmlText = await controller.getText();

    // validate
    if (_globalFormKey.currentState!.validate()) {
      if (!dateSelected || htmlText.isEmpty || image == null) {
        snackBarViewer.errorSnackbar(context, "All the field are Mandatory!!");
      } else {
        print({
          "articleTitle": articleTitleController.text,
          "branch": selectedBranch!.name,
          "date": selectedDate,
          "articleCategory": selectedArticleCategory!.categoryName,
          "description": htmlText,
          image: image
        });
        setState(() {
          isLoading = true;
        });
        Provider.of<ArticleProvider>(context, listen: false)
            .addArticleToServer(
                articleTitle: articleTitleController.text,
                branch: selectedBranch!,
                date: selectedDate.toString(),
                articleCategory: selectedArticleCategory!,
                description: htmlText,
                image: image)
            .then((response) {
          print(response.statusCode);
          if (response.statusCode == 201) {
            controller.clear();
            articleTitleController.clear();
            setState(() {
              selectedBranch = branches.first;
              selectedArticleCategory = articleCategories.first;
              imagePicked = false;
              dateSelected = false;
              isLoading = false;
            });
            snackBarViewer.sucessSnackbar(
                context, "Article Posted Sucessfully!");
          }
        }).catchError((err) {
          print(err);
          snackBarViewer.errorSnackbar(context, err);
        });
      }
    } else {
      return;
    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    branches = Provider.of<BranchProvider>(context).branches;
    articleCategories =
        Provider.of<ArticleCategoryProvider>(context).articleCategory;
    selectedBranch = branches.first;
    selectedArticleCategory = articleCategories.first;
    print("First");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    if (isLoading) {
      loading(context, "Posting");
    } else {
      dismissLoading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Article"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Card(
            elevation: 2,
            color: selectColor.cardColor,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.04,
                  vertical: deviceHeight * 0.02),
              // height: deviceHeight * 0.9,
              width: deviceWidth,
              child: Column(
                children: [
                  Form(
                    key: _globalFormKey,
                    child: TextFormField(
                      controller: articleTitleController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Article Title",
                          labelStyle: TextStyle(color: Colors.grey)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Article Title can't be empty!";
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  // Others Options
                  Row(
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
                        child: TextButton(
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
                                  dateSelected
                                      ? "${dateFormatter(selectedDate)}"
                                      : "Select Date",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Container(
                      child: Row(
                    children: [
                      Text(
                        "Article Category: ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      DropdownButtonHideUnderline(
                        child: DropdownButton(
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            iconEnabledColor: Colors.grey,
                            value: selectedArticleCategory,
                            items:
                                articleCategories.map((ArticleCategory items) {
                              return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    "${items.categoryName}",
                                    style: TextStyle(),
                                  ));
                            }).toList(),
                            onChanged: (ArticleCategory? value) {
                              setState(() {
                                selectedArticleCategory = value!;
                              });
                            }),
                      ),
                    ],
                  )),
                  // SizedBox(
                  //   height: deviceHeight * 0.02,
                  // ),

                  // // Ck Editor
                  // Divider(
                  //   color: Colors.grey,
                  // ),
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        "Article Detail:",
                        style: TextStyle(
                            color: Colors.grey, fontSize: deviceWidth * 0.04),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: deviceWidth * 0.02,
                  ),
                  HtmlEditor(
                    controller: controller,
                    htmlEditorOptions: HtmlEditorOptions(
                        hint: "Article Detail", spellCheck: true
                        //initalText: "text content initial, if any",
                        ),
                    otherOptions: OtherOptions(
                      height: deviceHeight * 0.4,
                    ),
                  ),
                  SizedBox(
                    height: deviceWidth * 0.02,
                  ),
                  // image Pick
                  GestureDetector(
                    onTap: () async {
                      print("Pick Image");
                      try {
                        XFile? selectedImage = await _imagePicker.pickImage(
                            source: ImageSource.gallery);

                        setState(() {
                          image = File(selectedImage!.path);
                          print(image);
                          imagePicked = true;
                        });
                      } catch (err) {
                        print(err);
                      }
                    },
                    child: DottedBorder(
                        dashPattern: [3, 6],
                        child: Container(
                          width: deviceWidth,
                          height: deviceHeight * 0.2,
                          child: imagePicked
                              ? ClipRRect(
                                  child: Image.file(image),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.upload,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      height: deviceHeight * 0.02,
                                    ),
                                    Text(
                                      "Select image for this article",
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                        )),
                  ),
                  SizedBox(
                    height: deviceWidth * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            addArticleHandler();
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                                Size(deviceWidth * 0.4, deviceHeight * 0.05)),
                          ),
                          child: Text("Add Article")),
                      ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              selectedBranch = branches.first;
                              selectedArticleCategory = articleCategories.first;
                              imagePicked = false;
                              dateSelected = false;
                            });
                            controller.clear();
                            articleTitleController.clear();
                          },
                          style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  Size(deviceWidth * 0.4, deviceHeight * 0.05)),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          child: Text("Clear All")),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
