import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Provider/languageProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Utils/material_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => LanguageProvider()),
        ChangeNotifierProvider(create: (ctx) => AnnouncementCategoryProvider()),
        ChangeNotifierProvider(create: (ctx) => AnnouncementProvider()),
        ChangeNotifierProvider(create: (ctx) => BranchProvider())
      ],
      child: MaterialApp(
        builder: EasyLoading.init(),
        theme: ThemeData(
            primarySwatch: colorCustom,
            accentColor: parseColor("#01378E"),
            scaffoldBackgroundColor: parseColor("#fafaed")),
        home: HomePage(),
      ),
    );
  }
}
