import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Utils/showSnackBarMessage.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  SnackBarViewer snackBarViewer = new SnackBarViewer();
  bool isLoading = false;
  bool foundEmail = true;

  resetPasswordHandler(String email) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      Provider.of<UserProvider>(context, listen: false)
          .forgetPassword(email)
          .then((response) {
        setState(() {
          isLoading = false;
        });
        if (response.statusCode == 200) {
          emailController.clear();
          snackBarViewer.sucessSnackbar(
              context, "Password Reset Link Sent to $email");
        } else {
          setState(() {
            foundEmail = false;
          });
          if (!_formKey.currentState!.validate()) {
            return;
          }
        }
      }).catchError((err) {
        setState(() {
          isLoading = false;
        });
        snackBarViewer.errorSnackbar(context, err);
      });
      print(email);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    if (isLoading) {
      loading(context, "Sending");
    } else {
      dismissLoading();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            // color: Colors.blue,
            width: deviceWidth * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: deviceHeight * 0.2,
                    width: deviceHeight * 0.2,
                    // color: Colors.blue,
                    child: ClipRRect(
                        child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.fill,
                    ))),
                SizedBox(height: deviceHeight * 0.03),
                Text(
                  "Please Enter you Email. We will send you password reset link on your mail. Provide Registered Email.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: deviceWidth * 0.045),
                ),
                SizedBox(height: deviceHeight * 0.03),
                Form(
                    key: _formKey,
                    child: TextFormField(
                      onChanged: (val) {
                        setState(() {
                          foundEmail = true;
                        });
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Email Field Can't be Empty";
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return "Please Enter Valid Email";
                        }
                        if (!foundEmail) {
                          return "$value is not registered!!";
                        }
                      },
                    )),
                SizedBox(height: deviceHeight * 0.03),
                ElevatedButton(
                  onPressed: () {
                    resetPasswordHandler(emailController.text);
                  },
                  child: Text("Submit",
                      style: TextStyle(fontSize: deviceWidth * 0.045)),
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size(deviceWidth * 0.5, deviceHeight * 0.05))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
