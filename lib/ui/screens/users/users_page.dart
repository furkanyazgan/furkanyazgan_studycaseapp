import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/riverpod_management.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/users_riverpod.dart';

class UsersPage extends ConsumerStatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UsersPageState();
}

class _UsersPageState extends ConsumerState<UsersPage> {
  @override
  void initState() {
    ref.read(usersRiverpod).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = ref.watch(usersRiverpod);
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
        future: ref.watch(usersRiverpod).getData(),
        builder: (_, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(child: CircularProgressIndicator(color: Colors.blue,));
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Image.asset(
                    "assets/voco_banner.jpeg",
                    height: 75.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Katılımcılar",
                      style: TextStyle(color: Colors.white, fontSize: 32.sp),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        return Card(
                          color: Colors.blue,
                          child: ListTile(
                            title: Text(data.users[index]!.firstName!),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  data.users[index]!.avatar!.toString()),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          height: 15.h,
                        );
                      },
                      itemCount: data.users!.length)
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
