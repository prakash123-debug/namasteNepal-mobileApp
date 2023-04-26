import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/donation.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:provider/provider.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    DonationDetail donationDetail =
        Provider.of<DonationProvider>(context).donationDetail;
    SelectColor selectColor = new SelectColor();
    return Scaffold(
        appBar: AppBar(
          title: Text("Donation"),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
                vertical: deviceHeight * 0.03, horizontal: deviceWidth * 0.03),
            child: Column(
              children: [
                DottedBorder(
                  dashPattern: [4, 4],
                  child: Container(
                    height: deviceHeight * 0.5,
                    width: deviceWidth,
                    // color: Colors.red,
                    child: ClipRRect(
                      child: Image.asset(
                        donationDetail.qrCode,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 0,
                      width: deviceWidth * 0.38,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                    ),
                    Text("OR"),
                    Container(
                      height: 0,
                      width: deviceWidth * 0.38,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.5, color: Colors.grey)),
                    ),
                  ],
                ),
                Expanded(
                    child: Container(
                  // color: Colors.amber,
                  padding: EdgeInsets.only(top: deviceHeight * 0.03),
                  child: Column(
                    children: [
                      Container(
                        width: deviceWidth * 0.8,
                        height: deviceHeight * 0.1,
                        // color: Colors.red,
                        child: ClipRRect(
                          child: Image.asset("assets/images/esewa.png"),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        // color: Colors.amber,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "eSewa Id :",
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: deviceWidth * 0.02,
                                ),
                                Text(
                                  donationDetail.walletId,
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.04,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            SizedBox(
                              height: deviceHeight * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "eSewa Name :",
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: deviceWidth * 0.02,
                                ),
                                Text(
                                  donationDetail.walletName,
                                  style: TextStyle(
                                      fontSize: deviceWidth * 0.04,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ))
              ],
            ),
          ),
        ));
  }
}
