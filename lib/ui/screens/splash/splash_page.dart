import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/riverpod_management.dart';
import 'package:furkanyazgan_studycaseapp/ui/screens/login/login_page.dart';
import 'package:furkanyazgan_studycaseapp/ui/screens/users/users_page.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    ref.read(storageRiverpod).getTokenData();
    Future.delayed(Duration(seconds: 2), () {
      if (ref.read(storageRiverpod).userToken != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  UsersPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>  LoginPage()),
        );
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/voco_logo.jpeg"),
            SizedBox(
              height: 15.h,
            ),
            CircularProgressIndicator(
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
