import 'package:flutter/material.dart';
import 'package:namaste_nepal/Widgets/bottomNavBar.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Center(
        child: Text(
          "Messaging Page!!",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
