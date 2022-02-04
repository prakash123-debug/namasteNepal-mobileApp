import 'package:flutter/material.dart';
import 'package:namaste_nepal/Provider/bottomNavProvider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int bottomNavBarIndex = 0;
  bool isBeginning = true;
  @override
  void didChangeDependencies() {
    if (isBeginning) {
      bottomNavBarIndex = Provider.of<BottomNavProvider>(context).activeBar;
    }
    isBeginning = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ;
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavBarIndex,
        showUnselectedLabels: false,
        showSelectedLabels: true,
        selectedLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        iconSize: 30,
        elevation: 2,
        onTap: (val) {
          Provider.of<BottomNavProvider>(context, listen: false)
              .setActiveBar(val);

          setState(() {
            bottomNavBarIndex = val;
          });
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.home_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Home",
              tooltip: "Home"),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.local_activity,
                color: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.local_activity_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Activity",
              tooltip: "Activity"),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.add,
                color: Theme.of(context).primaryColor,
              ),
              label: "Add",
              tooltip: "Add"),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.message,
                color: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.message_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Message",
              tooltip: "Message"),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
              ),
              icon: Icon(
                Icons.person_outlined,
                color: Theme.of(context).primaryColor,
              ),
              label: "Person",
              tooltip: "Person"),
        ]);
  }
}
