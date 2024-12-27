import 'package:flutter/material.dart';

// observer design pattern


class theme extends ChangeNotifier {
  bool _dark =  false;

  bool get dark => _dark;

  void changeTheme() {
    _dark = !_dark;
    notifyListeners();
  }
}
