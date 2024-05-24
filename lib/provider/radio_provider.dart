import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier {
  int _selectedValue = 0;

  int get selectedValue => _selectedValue;

  void setSelectedValue(int value) {
    _selectedValue = value;
    notifyListeners();
  }
}
