import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:namaste_nepal/Utils/server_link.dart';

class DonationDetail {
  String qrCode;
  String walletId;
  String walletName;

  DonationDetail(
      {required this.qrCode, required this.walletId, required this.walletName});
}

class DonationProvider extends ChangeNotifier {
  Dio dio = new Dio();
  DonationDetail _donationDetail =
      DonationDetail(qrCode: "qr Code", walletId: "-", walletName: "-");

  DonationDetail get donationDetail {
    return _donationDetail;
  }

  Future<Response> getDonationDetailFromServer() async {
    try {
      print("=========Dontaion");
      Response response = await dio.get("$link/donation");
      var responseData = response.data;
      print("=========Dontaion");
      print(response.data);
      print("=========Dontaion");
      _donationDetail = DonationDetail(
          qrCode:
              "$imageLink/${responseData["data"][0]["donationImage"]["fileName"]}",
          walletId: responseData["data"][0]["phoneNo"],
          walletName: responseData["data"][0]["name"]);
      notifyListeners();
      return response;
    } catch (err) {
      throw err;
    }
  }
}
