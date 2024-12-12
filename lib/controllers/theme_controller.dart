import 'package:flutter/material.dart';


class theme extends ChangeNotifier {
  bool _dark =  false;

  bool get dark => _dark;

  void changeTheme() {
    _dark = !_dark;
    //SharedPrefs().saveBool('dark', _dark);
    notifyListeners();
  }
}
