import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:namaste_nepal/Pages/editUserDetailPage.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:namaste_nepal/Pages/login.dart';
import 'package:namaste_nepal/Pages/userProfile.dart';
import 'package:namaste_nepal/Provider/announcementCategoryProvider.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/articalCategoryProvider.dart';
import 'package:namaste_nepal/Provider/articleProvider.dart';
import 'package:namaste_nepal/Provider/bottomNavProvider.dart';
import 'package:namaste_nepal/Provider/branchProvider.dart';
import 'package:namaste_nepal/Provider/carouselImageProvider.dart';
import 'package:namaste_nepal/Provider/donation.dart';
import 'package:namaste_nepal/Provider/functionProvider.dart';
import 'package:namaste_nepal/Provider/galleryProvider.dart';
import 'package:namaste_nepal/Provider/languageProvider.dart';
import 'package:namaste_nepal/Provider/newsProvider.dart';
import 'package:namaste_nepal/Provider/organizationProvider.dart';
import 'package:namaste_nepal/Provider/programCategoryProvider.dart';
import 'package:namaste_nepal/Provider/programProvider.dart';
import 'package:namaste_nepal/Provider/socialWorkProvider.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/Drawer/drawer.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/loading.dart';
import 'package:namaste_nepal/Utils/material_color.dart';
import 'package:namaste_nepal/selectPage.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put<MyDrawerController>(MyDrawerController());
  // Get.lazyPut((() => MyDrawerController()));

  runApp(MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  selectPage() {}
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => LanguageProvider()),
        ChangeNotifierProvider(create: (ctx) => AnnouncementCategoryProvider()),
        ChangeNotifierProvider(create: (ctx) => AnnouncementProvider()),
        ChangeNotifierProvider(create: (ctx) => BranchProvider()),
        ChangeNotifierProvider(create: (ctx) => BottomNavProvider()),
        ChangeNotifierProvider(create: (ctx) => FunctionProvider()),
        ChangeNotifierProvider(create: (ctx) => ArticleCategoryProvider()),
        ChangeNotifierProvider(create: (ctx) => ArticleProvider()),
        ChangeNotifierProvider(create: (ctx) => ProgramCategoryProvider()),
        ChangeNotifierProvider(create: (ctx) => ProgramProvider()),
        ChangeNotifierProvider(create: (ctx) => UserProvider()),
        ChangeNotifierProvider(create: (ctx) => GalleryProvider()),
        ChangeNotifierProvider(create: (ctx) => NewsProvider()),
        ChangeNotifierProvider(create: (ctx) => DonationProvider()),
        ChangeNotifierProvider(create: (ctx) => OrganizationProvider()),
        ChangeNotifierProvider(create: (ctx) => SocialWorkProvider()),
        ChangeNotifierProvider(create: (ctx) => CarouselImageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        theme: ThemeData(
          primarySwatch: colorCustom,
          scaffoldBackgroundColor: parseColor("#ffffd9"),

          // parseColor("#fafaed")
        ),
        home: const HomePage(),
      ),
    );
  }
}
