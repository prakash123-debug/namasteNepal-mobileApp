import 'package:flutter/material.dart';

class SocialWorks extends StatefulWidget {
  const SocialWorks({Key? key}) : super(key: key);

  @override
  State<SocialWorks> createState() => _SocialWorksState();
}

class _SocialWorksState extends State<SocialWorks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Work"),
      ),
    );
  }
}
