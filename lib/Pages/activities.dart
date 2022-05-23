import 'package:flutter/material.dart';
import 'package:namaste_nepal/Widgets/announcementGridView.dart';
import 'package:namaste_nepal/Widgets/bottomNavBar.dart';
import 'package:namaste_nepal/Widgets/mainPageCategory.dart';
import 'package:namaste_nepal/Widgets/menuNotification.dart';

class Activities extends StatefulWidget {
  const Activities({Key? key}) : super(key: key);

  @override
  _ActivitiesState createState() => _ActivitiesState();
}

class _ActivitiesState extends State<Activities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Column(
          children: [
            // menuNotification(context),
            announcementGridView(context),
            tabsForCategories(context: context)
          ],
        ),
      ),
    );
  }
}
