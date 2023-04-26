import 'package:flutter/material.dart';
import 'package:namaste_nepal/Utils/colorsSelect.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  SelectColor selectColor = new SelectColor();
  @override
  Widget build(BuildContext context) {
    // double deviceHeight = MediaQuery.of(context).size.height;
    // double deviceWidth = MediaQuery.of(context).size.width;
    // List<SocialWork> listOfSocialWork =
    //     Provider.of<SocialWorkProvider>(context).socialWork;
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: Center(
          child: Text("Comming Soon..."),
        ));
  }
}
