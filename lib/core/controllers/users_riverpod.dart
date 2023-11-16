import 'package:flutter/material.dart';
import 'package:furkanyazgan_studycaseapp/core/models/user_model.dart';
import 'package:furkanyazgan_studycaseapp/core/services/service.dart';

class UsersRiverpod extends ChangeNotifier {
  final services = Services();
  bool? isLoading;
  List<UserModelData?> users = [];

  Future<void>  getData() async {
    await services.usersFethc().then((value) {
      if (value != null) {
        users = value.data!;
        isLoading = true;
      } else {
        isLoading = false;
      }
    });
  }
}
