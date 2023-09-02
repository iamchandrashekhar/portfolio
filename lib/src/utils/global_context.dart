import 'package:flutter/material.dart';

BuildContext? mainContext;
bool hasContext() => mainContext != null;
void setContext(BuildContext context) {
  mainContext = context;
}
