import 'package:flutter/material.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/announcement.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/article.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/branches.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/donation.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/namasteNepal.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/news.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/programs.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/socialWork.dart';
import 'package:namaste_nepal/Provider/functionProvider.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';
import 'package:namaste_nepal/Utils/customPageRoute.dart';
import 'package:provider/provider.dart';

import '../Pages/FunctionsPage/gallery.dart';

selectPageToRoute(BuildContext context, FunctionDetail functionDetail) {
  switch (functionDetail.id) {
    case 1:

      // Navigator.pushNamed(context, "/our_information");

      Navigator.of(context).push(CustomPageRoute(child: NamasteNepal()));
      break;

    //   case 1:
    //     // Navigator.pushNamed(context, "/yojanatathaparyojana");
    //     lunchInApp("com.example.tourism_app");
    //     break;

    case 2:
      // lunchInApp("com.example.hello_mayor");
      Navigator.of(context).push(CustomPageRoute(child: Gallery()));

      break;

    case 3:
      // Navigator.pushNamed(context, "/tabpage");

      Navigator.of(context).push(CustomPageRoute(child: Branches()));

      break;

    case 4:
      // Navigator.pushNamed(context, "/nagarkpalika_woda_patra");

      Navigator.of(context).push(CustomPageRoute(child: News()));

      break;

    //   // case 8:
    //   //   Navigator.pushNamed(context, "/nagarpalika_profile");
    //   //   break;

    case 5:
      // Navigator.pushNamed(context, "/revenue");

      Navigator.of(context).push(CustomPageRoute(child: SocialWorks()));

      break;

    case 6:
      // Navigator.pushNamed(context, "/bivhakharu");

      Navigator.of(context).push(CustomPageRoute(child: AnnouncementPage()));

      break;

    case 7:
      // Navigator.pushNamed(context, "/yenKanunNerdeSeek");

      Navigator.of(context).push(CustomPageRoute(child: ProgramsPage()));
      break;

    case 8:
      // Navigator.pushNamed(context, "/employee");

      Navigator.of(context).push(CustomPageRoute(child: ArticlePage()));
      break;

    case 9:
      // Navigator.pushNamed(context, "/import_number_list_page");

      Navigator.of(context).push(CustomPageRoute(child: DonationPage()));
      break;

    default:
      print("To Be Created !!");
      break;
  }
}

Widget drawerFunctionList(BuildContext context) {
  SelectColor selectColor = SelectColor();
  List<FunctionDetail> functions =
      Provider.of<FunctionProvider>(context).allfunctions;
  return Container(
    child: Column(
        children: functions.asMap().entries.map((e) {
      return ListTile(
        leading: Icon(
          Icons.list,
          color: selectColor.cardColor,
        ),
        title: Text(
          e.value.functionName,
          style: TextStyle(
              color: selectColor.cardColor, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          selectPageToRoute(context, e.value);
        },
      );
    }).toList()
        // [
        // ListTile(
        //   leading: Icon(
        //     Icons.list,
        //     color: Colors.white,
        //   ),
        //   title: Text(
        //     "Namaste Nepal",
        //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //   ),
        //   onTap: () {},
        // ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "Gallery",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "Branches",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "News",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "Social Work",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "Announcement",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "Program",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        //   ListTile(
        //     leading: Icon(
        //       Icons.list,
        //       color: Colors.white,
        //     ),
        //     title: Text(
        //       "Article",
        //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        //     ),
        //     onTap: () {},
        //   ),
        // ],
        ),
  );
}
