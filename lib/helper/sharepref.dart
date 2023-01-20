import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setSession extends ChangeNotifier {
  static const String NIK = "NIK";

  String? nik;

  static Future<void> createTest(
      nik,
      ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(NIK, nik!);
  }

  static Future<void> createIdVendor(String idVendor) async {
    final sharePref = await SharedPreferences.getInstance();
    sharePref.setString(NIK, idVendor);
  }

  Future<String?> getTest() async {
    final prefs = await SharedPreferences.getInstance();
    nik = prefs.getString(NIK)!;
    log('message_DATA: $nik');
    notifyListeners();

    return prefs.getString(NIK);
  }

}