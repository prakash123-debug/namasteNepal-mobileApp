import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:namaste_nepal/Utils/Drawer/drawer.dart';

class MenuNotification extends GetView<MyDrawerController> {
  const MenuNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: controller.toggleDrawer,
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

Widget menuNotification(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              return Scaffold.of(context).openDrawer();
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
