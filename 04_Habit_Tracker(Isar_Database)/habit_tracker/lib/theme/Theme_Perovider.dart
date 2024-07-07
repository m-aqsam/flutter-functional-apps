// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:habit_tracker/theme/Dark_Mode.dart';
import 'package:habit_tracker/theme/Light_Mode.dart';

class ThemeProvider extends ChangeNotifier {
  // Initialize light mode
  ThemeData _themeData = lightMode;

  // get current theme

  ThemeData get themeData => _themeData;

  // if current theme dark mode

  bool get isDarkMode => _themeData == darkMode;

  // set theme

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  // toggle theme

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
