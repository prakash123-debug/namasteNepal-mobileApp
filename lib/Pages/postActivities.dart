import 'package:flutter/material.dart';
import 'package:namaste_nepal/Widgets/bottomNavBar.dart';

class AddActivities extends StatefulWidget {
  const AddActivities({Key? key}) : super(key: key);

  @override
  _AddActivitiesState createState() => _AddActivitiesState();
}

class _AddActivitiesState extends State<AddActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text(
          "Posting page!!",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
