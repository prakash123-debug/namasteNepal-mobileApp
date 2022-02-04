import 'package:flutter/foundation.dart';

class BottomNavProvider extends ChangeNotifier {
  int _activeBar = 0;

  int get activeBar {
    return _activeBar;
  }

  setActiveBar(int val) {
    _activeBar = val;
    notifyListeners();
  }
}
