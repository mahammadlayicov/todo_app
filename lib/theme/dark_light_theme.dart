import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.blue,
    surface: Colors.white,
    background: Colors.grey.shade200,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
  ),
);
final ThemeData dark = ThemeData(
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blue,
    surface: Color.fromARGB(255, 29, 26, 26),
    background: Color.fromARGB(255, 29, 26, 26),
    onSecondary: Color.fromARGB(255, 251, 248, 248),
  ),
);
