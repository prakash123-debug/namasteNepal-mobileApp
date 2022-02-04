import 'package:flutter/material.dart';

Widget menuNotification(BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {},
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
