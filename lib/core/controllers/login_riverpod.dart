import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/riverpod_management.dart';
import 'package:furkanyazgan_studycaseapp/core/services/service.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/storage_riverpod.dart';

class LoginRiverpod extends ChangeNotifier {
  LoginRiverpod(this.storageRiverpods);
  final StorageRiverpod storageRiverpods;
  final services = Services();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowError = false;

  Future<void> showErrorMessage() async {
    isShowError = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 3)).then((value) {
      isShowError = false;
      notifyListeners();
    });
  }

  Future<bool?> loginClick() async {
    var temp = false ;
    await services
        .loginService(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      if (value != false) {
        print(  "başarılı");
        storageRiverpods.setTokenData(value["token"]);
        temp = true;
      } else {
        showErrorMessage();

      }
    });
    return temp;
  }
}
