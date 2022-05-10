import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/functionProvider.dart';
import 'package:provider/provider.dart';

selectPageToRoute(FunctionDetail functionDetail) {
  print(functionDetail.id);
  switch (functionDetail.id) {
    // case 0:

    // Navigator.pushNamed(context, "/our_information");

    // Navigator.of(context).push(CustomPageRoute(child: OurInformation()));
    // break;

    case 1:
      // Navigator.pushNamed(context, "/yojanatathaparyojana");
      // lunchInApp("com.example.tourism_app");
      print("Namaste Nepal");
      break;

    case 2:
      // lunchInApp("com.example.hello_mayor");
      print("Gallery");

      break;

    case 3:
      // Navigator.pushNamed(context, "/tabpage");

      // Navigator.of(context).push(CustomPageRoute(child: TabPages()));
      print("Branches");

      break;

    case 4:
      // Navigator.pushNamed(context, "/nagarkpalika_woda_patra");

      // Navigator.of(context)
      //     .push(CustomPageRoute(child: NagarpalikaWodaPatra()));
      print("News");

      break;

    // case 8:
    //   Navigator.pushNamed(context, "/nagarpalika_profile");
    //   break;

    case 5:
      // Navigator.pushNamed(context, "/revenue");

      // Navigator.of(context).push(CustomPageRoute(child: Revenue()));
      print("Social Work");

      break;

    case 6:
      // Navigator.pushNamed(context, "/bivhakharu");

      // Navigator.of(context).push(CustomPageRoute(child: Bivhak()));

      print("Announcement");

      break;

    case 7:
      // Navigator.pushNamed(context, "/yenKanunNerdeSeek");

      // Navigator.of(context).push(CustomPageRoute(child: YenKanun()));
      print("Program");

      break;

    case 8:
      // Navigator.pushNamed(context, "/employee");

      // Navigator.of(context).push(CustomPageRoute(child: Employee()));
      print("Article");

      break;

    case 9:
      // Navigator.pushNamed(context, "/import_number_list_page");

      // Navigator.of(context).push(CustomPageRoute(child: ImportantNumberList()));
      break;

    default:
      print("To Be Created !!");
      break;
  }
}

Widget drawerFunctionList(BuildContext context) {
  List<FunctionDetail> functions =
      Provider.of<FunctionProvider>(context).allfunctions;
  return Container(
    child: Column(
        children: functions.asMap().entries.map((e) {
      return ListTile(
        leading: Icon(
          Icons.list,
          color: Colors.white,
        ),
        title: Text(
          e.value.functionName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        onTap: () {
          selectPageToRoute(e.value);
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
