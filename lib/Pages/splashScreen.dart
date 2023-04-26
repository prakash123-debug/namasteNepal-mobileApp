import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:slide_countdown/slide_countdown.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              // color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideCountdownSeparated(
                    height: 120,
                    width: 120,
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.white),
                    duration: const Duration(seconds: 10),
                    onDone: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => HomePage()),
                          (route) => false);
                    },
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Image.asset("assets/images/logo.png"))
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: MediaQuery.of(context).size.width * 0.39,
            child: Text(
              "Version 1.0.0",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          // Positioned(
          //   top: 100,
          //   left: MediaQuery.of(context).size.width * 0.35,
          //   child: SlideCountdownSeparated(
          //     height: 120,
          //     width: 120,
          //     textStyle: TextStyle(
          //         fontWeight: FontWeight.bold,
          //         fontSize: 24,
          //         color: Colors.white),
          //     duration: const Duration(seconds: 60),
          //   ),
          // )
        ],
      ),
    );
  }
}
