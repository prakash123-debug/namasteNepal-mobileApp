import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:namaste_nepal/Utils/Drawer/drawer.dart';

class MenuNotification extends StatefulWidget {
  MenuNotification(
      {Key? key, required ZoomDrawerController this.zoomDrawerController})
      : super(key: key);

  ZoomDrawerController zoomDrawerController;

  @override
  State<MenuNotification> createState() => _MenuNotificationState(z: z);
}

class _MenuNotificationState extends State<MenuNotification> {
  _MenuNotificationState({required this.z});
  ZoomDrawerController z;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                print(z.toggle);

                z.toggle!();
              },
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).primaryColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    );
  }
}

// class MenuNotification extends GetView<MyDrawerController> {
//   const MenuNotification({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           IconButton(
//               onPressed: controller.toggleDrawer,
//               icon: Icon(
//                 Icons.menu,
//                 color: Theme.of(context).primaryColor,
//               )),
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.notifications_none,
//                 color: Theme.of(context).primaryColor,
//               )),
//         ],
//       ),
//     );
//   }
// }

// Widget menuNotification(BuildContext context) {
//   return Container(
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//             onPressed: () {
//               return Scaffold.of(context).openDrawer();
//             },
//             icon: Icon(
//               Icons.menu,
//               color: Theme.of(context).primaryColor,
//             )),
//         IconButton(
//             onPressed: () {},
//             icon: Icon(
//               Icons.notifications_none,
//               color: Theme.of(context).primaryColor,
//             )),
//       ],
//     ),
//   );
// }
