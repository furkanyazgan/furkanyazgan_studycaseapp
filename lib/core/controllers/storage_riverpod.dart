import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRiverpod extends ChangeNotifier {
  String? userToken = null;



  void setTokenData(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", token);
    userToken = token;
    notifyListeners();
  }

  void getTokenData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    userToken = pref.getString("token");
    notifyListeners();
  }
}
