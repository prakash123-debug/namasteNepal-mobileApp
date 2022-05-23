// import 'package:flutter/material.dart';
// import 'package:namaste_nepal/Pages/activities.dart';
// import 'package:namaste_nepal/Pages/chat.dart';
// import 'package:namaste_nepal/Pages/homePage.dart';
// import 'package:namaste_nepal/Pages/postActivities.dart';
// import 'package:namaste_nepal/Pages/profile.dart';
// import 'package:namaste_nepal/Provider/bottomNavProvider.dart';
// import 'package:provider/provider.dart';

// class SelectPage extends StatefulWidget {
//   const SelectPage({Key? key}) : super(key: key);

//   @override
//   _SelectPageState createState() => _SelectPageState();
// }

// class _SelectPageState extends State<SelectPage> {
//   @override
//   Widget build(BuildContext context) {
//     int currNavIndex = Provider.of<BottomNavProvider>(context).activeBar;
//     return currNavIndex == 0
//         ? HomePage()
//         : currNavIndex == 1
//             ? Activities()
//             : currNavIndex == 2
//                 ? AddActivities()
//                 : currNavIndex == 3
//                     ? Chat()
//                     : Profile();
//   }
// }
