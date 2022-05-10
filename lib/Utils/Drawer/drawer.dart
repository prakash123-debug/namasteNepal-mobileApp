import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:namaste_nepal/Pages/homePage.dart';
import 'package:namaste_nepal/Provider/userProvider.dart';
import 'package:namaste_nepal/Utils/colorParser.dart';
import 'package:namaste_nepal/Widgets/drawerFunctionList.dart';
import 'package:namaste_nepal/Widgets/drawerProfileViewing.dart';
import 'package:provider/provider.dart';

import '../material_color.dart';

class MyHomePage extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: parseColor("#E6E457"),
      body: GetBuilder<MyDrawerController>(
        builder: (_) => ZoomDrawer(
          controller: _.zoomDrawerController,
          style: DrawerStyle.defaultStyle,
          menuScreen: MenuScreen(),
          mainScreen: HomePage(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          drawerShadowsBackgroundColor: Colors.grey,
          slideWidth: MediaQuery.of(context).size.width * 0.65,
        ),
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceWeight = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    bool authorized = Provider.of<UserProvider>(context).authorized;
    return Container(
      color: colorCustom,
      child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            drawerProfileViewing(context, authorized),
            Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
            drawerFunctionList(context),
            Divider(
              thickness: 0.5,
              color: Colors.white,
            ),
            Container(
              padding: EdgeInsets.only(bottom: deviceHeight * 0.02),
              child: !authorized
                  ? Text("")
                  : ElevatedButton(
                      child: Text(
                        "Logout",
                        style: TextStyle(
                            color: colorCustom, fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(parseColor("#E6E457")),
                          fixedSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width * 0.4, 10))),
                      onPressed: () {
                        print("Logout/Login");
                        Provider.of<UserProvider>(context, listen: false)
                            .UpdateAuthentication(false);
                      },
                    ),
            )
          ])),
    );
  }
}

class MainScreen extends GetView<MyDrawerController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: controller.toggleDrawer,
          child: Text("Toggle Drawer"),
        ),
      ),
    );
  }
}

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
