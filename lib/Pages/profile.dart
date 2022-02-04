import 'package:flutter/material.dart';
import 'package:namaste_nepal/Widgets/bottomNavBar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text(
          "Profile Page!!",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
