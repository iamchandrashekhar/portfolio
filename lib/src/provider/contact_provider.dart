import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/intl.dart';

class ContactProvider extends ChangeNotifier {
  Future<bool> sendResponse(Map<String, String> formData) async {
    final now = DateTime.now();
    String currentDT = DateFormat('y-MMM-d K:m a').format(now);
    // give cloud firestore collection name in .env file
    // or in place of "dotenv.env['response']"

    final res = await FirebaseFirestore.instance
        .collection(dotenv.env['response']!)
        .doc(currentDT)
        .set(formData)
        .then((value) {
      return true;
    }).catchError((error) {
      log(error.toString());
      return false;
    });
    return res;
  }
}
