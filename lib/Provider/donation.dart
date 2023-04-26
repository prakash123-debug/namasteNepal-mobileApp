import 'dart:developer';

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
  DonationDetail _donationDetail = DonationDetail(
      qrCode: "assets/images/qr.png",
      walletId: "9844708763",
      walletName: "Arjun Kharel");

  DonationDetail get donationDetail {
    return _donationDetail;
  }

  Future<Response> getDonationDetailFromServer() async {
    try {
      Response response = await dio.get("$link/donation");
      var responseData = response.data["data"];

      //  DonationDetail donationTmp;
      responseData.forEach((element) {
        _donationDetail = DonationDetail(
            qrCode:
                "$imageLink/${responseData[0]["donationImage"]["fileName"]}",
            walletId: responseData[0]["phoneNo"],
            walletName: responseData[0]["name"]);
      });
      // _donationDetail = donationTmp;
      notifyListeners();
      return response;
    } catch (err) {
      log(err.toString());
      rethrow;
    }
  }
}
