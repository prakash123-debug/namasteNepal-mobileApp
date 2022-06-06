import 'package:flutter/material.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/announcement.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/article.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/branches.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/donation.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/gallery.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/namasteNepal.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/news.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/programs.dart';
import 'package:namaste_nepal/Pages/FunctionsPage/socialWork.dart';
import 'package:namaste_nepal/Provider/announcementProvider.dart';
import 'package:namaste_nepal/Provider/functionProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Utils/customPageRoute.dart';

Widget functionCard(BuildContext context, FunctionDetail data) {
  double deviceWidth = MediaQuery.of(context).size.width;
  double deviceHeight = MediaQuery.of(context).size.height;

  return Material(
    color: parseColor("#ebebbe"),
    clipBehavior: Clip.antiAliasWithSaveLayer,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 2,
    child: MaterialButton(
      // height: deviceHeight * 0.4,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      splashColor: Theme.of(context).primaryColor.withOpacity(0.4),
      onPressed: () {
        print(data.id);
        switch (data.id) {
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

            Navigator.of(context)
                .push(CustomPageRoute(child: AnnouncementPage()));

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
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: deviceHeight * 0.02,
          ),
          Container(
            height: deviceHeight * 0.06,
            // color: Colors.red,
            child: ClipRRect(
              child: Image.asset(
                data.functionImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                data.functionName,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                  decorationStyle: TextDecorationStyle.dotted,
                  fontSize: deviceWidth * 0.035,
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
