import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/riverpod_management.dart';
import 'package:furkanyazgan_studycaseapp/ui/screens/users/users_page.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/voco_banner.jpeg",
                height: 75.h,
              ),
              SizedBox(
                height: 102.h,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Giriş Yap",
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              TextField(
                controller: ref.read(loginRiverpod).emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    filled: true,
                    fillColor: Color(0xff1b1f2b),
                    hintText: "E-posta",
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ),
              SizedBox(
                height: 16.h,
              ),
              TextField(
                controller: ref.read(loginRiverpod).passwordController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide:
                          BorderSide(color: Colors.transparent, width: 0),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    filled: true,
                    fillColor: Color(0xff1b1f2b),
                    hintText: "Parola",
                    hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey)),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Align(alignment: Alignment.centerLeft,
                  child: Visibility(child: Text("E-posta veya parola yanlış.",style: TextStyle(color: Colors.red,fontSize: 12.sp),)
                  ,visible: ref.watch(loginRiverpod).isShowError,),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Divider(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              InkWell(
                onTap: () {
                  ref.read(loginRiverpod).loginClick().then((value) {
                    print(value.toString());
                    if(value == true){
                      print("trueeee");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  UsersPage()),
                      );
                    }
                  });
                },
                borderRadius: BorderRadius.circular(10.r),
                child: Container(
                  child: Center(
                    child: Text(
                      'Giriş Yap',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.blue),
                  ),
                  height: 42.h,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Wrap(
                children: [
                  Text(
                    "Giriş yaparak ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Kullanıcı sözleşmesini",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        decoration: TextDecoration.underline),
                  ),
                  Text(
                    "kabul etmiş olursunuz.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
