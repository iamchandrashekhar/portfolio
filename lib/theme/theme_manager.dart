import 'package:flutter/material.dart';

class ThemeManager extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  bool isDark() {
    return themeMode == ThemeMode.dark;
  }

  void toggleTheme() {
    themeMode = isDark() ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
