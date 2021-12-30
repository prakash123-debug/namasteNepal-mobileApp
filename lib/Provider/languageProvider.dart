import 'package:flutter/foundation.dart';

class LanguageProvider extends ChangeNotifier {
  bool _isNepali = false;

  bool get isNepali {
    return _isNepali;
  }

  setLanguage(bool isNepali) {
    _isNepali = !isNepali;
    notifyListeners();
  }
}
