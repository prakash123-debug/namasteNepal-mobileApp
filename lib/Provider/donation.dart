import 'package:flutter/cupertino.dart';

class DonationDetail {
  String qrCode;
  String walletId;
  String walletName;

  DonationDetail(
      {required this.qrCode, required this.walletId, required this.walletName});
}

class DonationProvider extends ChangeNotifier {
  DonationDetail _donationDetail = DonationDetail(
      qrCode:
          "https://static.wixstatic.com/media/380bd3_04ce0ffe62b544d599ee69d84b4bf7b8~mv2.jpg/v1/fill/w_560,h_776,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/Fonepay%20QR%20Code_JPG.jpg",
      walletId: "9816488487",
      walletName: "Prajwal Poudel");

  DonationDetail get donationDetail {
    return _donationDetail;
  }
}
