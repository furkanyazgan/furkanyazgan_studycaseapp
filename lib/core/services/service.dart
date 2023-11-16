import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:furkanyazgan_studycaseapp/core/models/user_model.dart';

class Services {
  final String baseUrl = "https://reqres.in/api/";
  final dio = Dio();

  Future<UserModel?> usersFethc() async {
    var response;
    try {
      response = await dio.get(baseUrl + "users?page=2");
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<dynamic?> loginService(
      {required String email, required String password}) async {
    Map<String, dynamic> json = {
      "email": email,
      "password": password,
    };

    try {
      var response = await dio.post(baseUrl + "login", data: json);
      print(response.statusCode);
      return response.data;
    } on DioException catch (e) {
      if (e.response != null) {
        print(e.response?.statusCode);
        return false;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
