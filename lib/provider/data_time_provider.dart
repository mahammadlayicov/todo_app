import 'package:flutter/material.dart';

class DateTimeProvider extends ChangeNotifier {
  String dateString = "dd/mm/yy";

  void setSelectedDate(String value) {
    dateString = value;
    notifyListeners();
  }

  String timeString = "hh:mm";

  void setSelectedTime(String value) {
    timeString = value;
    notifyListeners();
  }
}
