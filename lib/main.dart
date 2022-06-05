import 'package:doantotnghiep/Screens/Account/account.dart';
import 'package:doantotnghiep/Screens/HomePage/home.dart';
import 'package:doantotnghiep/Screens/Login/login.dart';
import 'package:doantotnghiep/Screens/Setting/setting.dart';
import 'package:doantotnghiep/Screens/ViewStack/view_stack.dart';
import 'package:doantotnghiep/auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const AuthScreen(),
        '/login': (_) => const LoginScreen(),
        '/view_stack': (_) => const ViewStack(),
        '/home': (_) => const HomePage(),
        '/account': (_) => const AccountScreen(),
        '/setting': (_) => const SettingScreen(),
      },
    );
  }
}
