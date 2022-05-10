import 'package:flutter/foundation.dart';

class UserDetail {
  int id;
  String fullname;
  String email;
  String phone;
  String gender;

  UserDetail(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.phone,
      required this.gender});
}

class UserProvider extends ChangeNotifier {
  UserDetail _userData = UserDetail(
      id: 1,
      fullname: "Prajwal Poudel",
      email: "prajwalpoudel55@gmail.com",
      phone: "9816488487",
      gender: "Male");
  bool _authorized = false;

  UserDetail get userData {
    return _userData;
  }

  bool get authorized {
    return _authorized;
  }

  void UpdateAuthentication(bool authorized) {
    _authorized = authorized;
    notifyListeners();
  }
}
