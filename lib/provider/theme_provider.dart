import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/theme/dark_light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = light;
  ThemeData get themeData => _themeData;
  bool _value = false;
  bool get value => _value;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void changeValue() {
    if (_themeData == light) {
      themeData = dark;
    } else {
      themeData = light;
    }
    _value = !_value;
    notifyListeners();
  }
}
