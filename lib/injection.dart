// import 'package:skin_detective/providers/app/app.dart';
import 'package:doantotnghiep/Screens/HomePage/home.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// import 'package:skin_detective/providers/user/user.dart';

Future<void> configurationDependInjection() async {
  var getIt = GetIt.instance;

  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() => GlobalKey());
  getIt.registerLazySingleton<HomeLogic>(() => HomeLogic());
  // getIt.registerLazySingleton<UserViewModel>(() => UserViewModel());

  return Future.value();
}
