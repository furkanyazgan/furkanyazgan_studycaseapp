import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/login_riverpod.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/storage_riverpod.dart';
import 'package:furkanyazgan_studycaseapp/core/controllers/users_riverpod.dart';

StorageRiverpod temp = StorageRiverpod();
final storageRiverpod = ChangeNotifierProvider((ref) => temp);
final loginRiverpod = ChangeNotifierProvider((ref) => LoginRiverpod( temp));
final usersRiverpod = ChangeNotifierProvider((ref) => UsersRiverpod( ));
