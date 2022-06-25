import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_parser/http_parser.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Utils/server_link.dart';
import 'package:http/http.dart' as http;

class UserDetail {
  int id;
  String fullname;
  String email;
  String phone;
  String gender;
  String address;
  String dateOfBirth;
  int branchId;
  String profilePicture;
  int profilePictureId;

  UserDetail(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.phone,
      required this.gender,
      required this.address,
      required this.dateOfBirth,
      required this.branchId,
      required this.profilePicture,
      required this.profilePictureId});
}

class UserProvider extends ChangeNotifier {
  Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  UserDetail _userData = UserDetail(
      id: 1,
      fullname: "",
      email: "",
      phone: "",
      gender: "",
      address: "",
      dateOfBirth: "",
      profilePicture: "",
      branchId: 1,
      profilePictureId: 1);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? gender;
  DateTime? dateOfBirth;
  File? profilePic;
  Branch? branch;
  // edit section variable
  TextEditingController editUsernameController = TextEditingController();
  TextEditingController editFullNameController = TextEditingController();
  TextEditingController editPhoneNumberController = TextEditingController();
  TextEditingController editAddressController = TextEditingController();
  String? editGender;
  DateTime? editDateOfBirth;
  File? editProfilePic;
  Branch? editBranch;

  bool _authorized = false;

  UserDetail get userData {
    return _userData;
  }

  bool get authorized {
    return _authorized;
  }

  Future<http.Response> loginServer() async {
    print("Called");
    try {
      Uri url = Uri.parse("$link/user/login");
      print(url.toString());
      http.Response response = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: json.encode({
            "email": usernameController.text,
            "password": passwordController.text
          }));
      print(response.body);
      print(response.statusCode);
      var data = json.decode(response.body);
      // print(response.data);

      if (response.statusCode == 200) {
        await storage.write(key: tokenKey, value: data["accessToken"]);
        Map<String, dynamic> payload = Jwt.parseJwt(data["accessToken"]);
        print(payload);
        String profilePic =
            "$imageLink/${await getImageFromServer(payload["profilePictureId"])}";
        print(profilePic);

        UserDetail tempUserData = UserDetail(
            id: payload["userId"],
            fullname: payload["fullName"],
            email: payload["email"],
            phone: payload["mobileNumber"],
            gender: payload["gender"],
            address: payload["address"] == null ? "null" : payload["address"],
            dateOfBirth: payload["dateOfBirth"],
            profilePicture: profilePic,
            profilePictureId: payload["profilePictureId"],
            branchId: payload["branchId"]);
        print(response.statusCode);
        UpdateAuthentication(true);
        usernameController.clear();
        passwordController.clear();
        _userData = tempUserData;
      } else {
        throw throw data["message"];
      }

      notifyListeners();

      return response;
    } catch (err) {
      // print(err);
      throw err;
    }
  }

// Fetching Profile Picture From Server
  Future<String> getImageFromServer(int id) async {
    Response getImage = await dio.get("$link/file/$id",
        options: Options(
          validateStatus: (_) => true,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    return getImage.data["fileData"]["fileName"];
  }

  // Register User...

  Future<http.Response> registerServer() async {
    try {
      int imageId = await uploadImageOnServer(profilePic!);

      print("========Register User");
      Uri url = Uri.parse("$link/user/sign-up");
      print("========Register User001");

      Map<String, dynamic> data = {
        "fullName": fullNameController.text,
        "mobileNumber": phoneNumberController.text,
        "address": addressController.text,
        "email": usernameController.text,
        "password": passwordController.text,
        "confirmPassword": confirmPasswordController.text,
        "gender": gender,
        "dateOfBirth": dateOfBirth.toString(),
        "branchId": branch!.id,
        "profilePictureId": imageId
      };
      // var userData1 = jsonEncode(data);
      // print(userData1);

      http.Response registerResponse = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: json.encode(data));

      // Response registerResponse = await haalData(data);

      print(registerResponse.body);
      print("${registerResponse.statusCode}");
      if (registerResponse.statusCode == 201) {
        fullNameController.clear();
        usernameController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        phoneNumberController.clear();
        addressController.clear();
      } else if (registerResponse.statusCode == 500) {
        throw "Internal Server Error!";
      }
      notifyListeners();
      // return response;
      return registerResponse;
    } catch (err) {
      print(err);
      throw err;
    }
  }

  // edit User Data

  Future<Response> editUserDetail(
      int userId, bool imagePicked, int profilePictureId) async {
    try {
      String? token = await storage.read(key: tokenKey);
      // collect Data && make FormMap
      int imageId = imagePicked
          ? await uploadImageOnServer(editProfilePic!)
          : profilePictureId;

      print(editBranch!.id);

      int branchId = editBranch!.id;
      String doB = editDateOfBirth.toString();

      Response response = await dio.patch("$link/user/$userId",
          data: {
            "fullName": editFullNameController.text,
            "email": editUsernameController.text,
            "mobileNumber": editPhoneNumberController.text,
            "gender": editGender,
            "profilePictureId": imageId,
            "branchId": branchId,
            "address": editAddressController.text,
            "dateOfBirth": doB
          },
          options: Options(
              validateStatus: (_) => true,
              contentType: Headers.jsonContentType,
              responseType: ResponseType.json,
              headers: {"Authorization": "Bearer $token"}));
      print("==============Edit Data");
      print(response.data);
      print("==============Edit Data");
      if (response.statusCode != 200) {
        throw "Something Went Wrong Please Try Again !!";
      }
      return response;
    } catch (err) {
      print(err);
      throw err;
    }
  }

  // Send Profile Pic to server

  Future<int> uploadImageOnServer(File image) async {
    try {
      FormData picture = FormData.fromMap({
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.split("/").last,
            contentType: new MediaType("image", "jpeg")),
      });

      Response imageResponse = await dio.post("$link/file/single",
          data: picture,
          options: Options(
            validateStatus: (_) => true,
            contentType: Headers.jsonContentType,
            responseType: ResponseType.json,
          ));
      print(imageResponse.data);
      print(imageResponse.statusCode);
      return imageResponse.data["file"]["id"];
    } catch (err) {
      throw err;
    }
  }

  Future<Response> getUserByIdFromServer(int id) async {
    try {
      String? token = await storage.read(key: tokenKey);

      Options option = Options(headers: {"Authorization": "Bearer $token"});

      Response response = await dio.get("$link/user/$id", options: option);
      print(response.statusCode);

      return response;
    } catch (err) {
      throw err;
    }
  }

  void UpdateAuthentication(bool authorized) {
    _authorized = authorized;
    notifyListeners();
  }

  void logoutHandler() async {
    await storage.delete(key: tokenKey);
    UpdateAuthentication(false);
    notifyListeners();
  }
}
