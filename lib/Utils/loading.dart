// import 'package:bootwal_nagarpalika_app/Providers/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:namaste_nepal/Provider/languageProvider.dart';
import 'package:provider/provider.dart';
import './material_color.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.red
    ..backgroundColor = colorCustom
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

Future<void> loading(BuildContext context) async {
  // bool isNepali = Provider.of<LanguageProvider>(context).isNepali;
  EasyLoading.show(status: "Loading...", maskType: EasyLoadingMaskType.black);
}

Future<void> dismissLoading() async {
  EasyLoading.dismiss();
}
