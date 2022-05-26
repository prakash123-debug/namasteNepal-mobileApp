import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:namaste_nepal/Utils/server_link.dart';

class UserDetail {
  int id;
  String fullname;
  String email;
  String phone;
  String gender;
  String address;
  String dateOfBirth;
  int branchId;

  UserDetail(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.phone,
      required this.gender,
      required this.address,
      required this.dateOfBirth,
      required this.branchId});
}

class UserProvider extends ChangeNotifier {
  Dio dio = Dio();
  final storage = new FlutterSecureStorage();
  UserDetail _userData = UserDetail(
      id: 1,
      fullname: "fullname",
      email: "email",
      phone: "phone",
      gender: "gender",
      address: "address",
      dateOfBirth: "dateOfBirth",
      branchId: 1);

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _authorized = false;

  UserDetail get userData {
    return _userData;
  }

  bool get authorized {
    return _authorized;
  }

  loginServer() async {
    try {
      Response response = await dio.post("$link/user/login", data: {
        "email": usernameController.text,
        "password": passwordController.text
      });
      print(response.data);
      await storage.write(key: tokenKey, value: response.data["accessToken"]);
      Map<String, dynamic> payload = Jwt.parseJwt(response.data["accessToken"]);
      print(payload["userId"]);
      getUserByIdFromServer(payload["userId"]).then((value) {
        UserDetail tempUserData = UserDetail(
            id: payload["userId"],
            fullname: value.data["data"]["fullName"],
            email: value.data["data"]["email"],
            phone: value.data["data"]["mobileNumber"],
            gender: value.data["data"]["gender"],
            address: value.data["data"]["address"],
            dateOfBirth: value.data["data"]["dateOfBirth"],
            branchId: value.data["data"]["branch"]["id"]);
        _userData = tempUserData;
        if (value.statusCode == 201) {
          UpdateAuthentication(true);
          usernameController.clear();
          passwordController.clear();
        }
      });
      notifyListeners();
    } catch (err) {
      print(err);
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
}
