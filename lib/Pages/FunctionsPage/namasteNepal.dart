import 'package:flutter/material.dart';

class NamasteNepal extends StatefulWidget {
  const NamasteNepal({Key? key}) : super(key: key);

  @override
  State<NamasteNepal> createState() => _NamasteNepalState();
}

class _NamasteNepalState extends State<NamasteNepal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Namaste Nepal"),
      ),
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
