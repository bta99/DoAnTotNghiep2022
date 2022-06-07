import 'package:doantotnghiep/Services/LocalStorage/local_storage.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';
part 'auth_logic.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthLogic logic;

  @override
  void initState() {
    logic = AuthLogic(context: context);
    super.initState();
  }

  @override
  void dispose() {
    logic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          Assets.images.iconBg.path,
          width: 250,
          height: 250,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
