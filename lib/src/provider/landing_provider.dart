import 'package:flutter/material.dart';

class LandingProvider extends ChangeNotifier {
  int headerIndex = 0;

  void updateHeaderIndex(int index) {
    headerIndex = index;
    notifyListeners();
  }
}
