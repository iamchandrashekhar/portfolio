import 'package:flutter/material.dart';

BuildContext? mainContext;
bool hasContext() => mainContext != null;
void setContext(BuildContext context) {
  mainContext = context;
}

class LandingProvider extends ChangeNotifier {
  int headerIndex = 0;

  void updateHeaderIndex(int index) {
    headerIndex = index;
    notifyListeners();
  }
}
