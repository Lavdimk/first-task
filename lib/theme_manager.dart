import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  bool isDarkMode = false;

  ThemeData lightTheme = ThemeData(
      primaryColor: Colors.black,
      backgroundColor: Colors.white,
      buttonColor: Colors.purple.shade900
      // Shto ngjyrat e tjera për Light Mode
      );

  ThemeData darkTheme = ThemeData(
      primaryColor: Colors.white,
      backgroundColor: Colors.grey.shade700,
      buttonColor: const Color.fromARGB(255, 27, 26, 26)
      // Shto ngjyrat e tjera për Dark Mode
      );

  Color get appBarColor => isDarkMode
      ? const Color.fromARGB(255, 27, 26, 26)
      : Colors.purple.shade900;

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
}
