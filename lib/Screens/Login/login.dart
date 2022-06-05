import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Services/Helper/custom_loading.dart';
import 'package:doantotnghiep/Widgets/TextfieldCustom/textfield_custom.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:tuple/tuple.dart';
part 'login_logic.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginLogic loginLogic;
  @override
  void initState() {
    loginLogic = LoginLogic(context: context);
    super.initState();
  }

  @override
  void dispose() {
    loginLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: loginLogic,
      child: SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: AspectRatio(
                      aspectRatio: 2.5,
                      child: SvgPicture.asset(
                        Assets.images.bg,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Đăng nhập',
                    style: TextStyle(
                      color: AppColors.textBlack,
                      fontSize: 25,
                      fontFamily: Assets.googleFonts.montserratBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Email',
                        style: TextStyle(
                          color: AppColors.textBlack,
                          fontSize: 14,
                          fontFamily: Assets.googleFonts.montserratBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Consumer<LoginLogic>(
                    builder: (_, value, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldCustom(
                              errorBorder:
                                  loginLogic.txtEmail.text.trim().isNotEmpty &&
                                      loginLogic.errorEmail.isNotEmpty,
                              controller: loginLogic.txtEmail,
                              onChanged: (val) {
                                loginLogic.validateEmail(val);
                              },
                              placeholder: 'Nhập email...',
                              suFFixIcon:
                                  loginLogic.txtEmail.text.trim().isNotEmpty &&
                                          loginLogic.errorEmail.isNotEmpty
                                      ? const Icon(
                                          Icons.warning_amber_rounded,
                                          size: 20,
                                          color: AppColors.red,
                                        )
                                      : null),
                          const SizedBox(
                            height: 5,
                          ),
                          if (loginLogic.errorEmail.isNotEmpty)
                            Text(loginLogic.errorEmail,
                                style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 14,
                                  fontFamily: Assets.googleFonts.montserratBold,
                                  fontWeight: FontWeight.bold,
                                ))
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('Mật khẩu',
                        style: TextStyle(
                          color: AppColors.textBlack,
                          fontSize: 14,
                          fontFamily: Assets.googleFonts.montserratBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Consumer<LoginLogic>(
                    builder: (_, value, __) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFieldCustom(
                            typePassword: !loginLogic.showPassword,
                            errorBorder:
                                loginLogic.txtPassword.text.trim().isNotEmpty &&
                                    loginLogic.errorPassword.isNotEmpty,
                            controller: loginLogic.txtPassword,
                            onChanged: (val) {
                              loginLogic.validatePass(val);
                            },
                            placeholder: 'Nhập mật khẩu...',
                            suFFixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                loginLogic.txtPassword.text.trim().isNotEmpty &&
                                        loginLogic.errorPassword.isNotEmpty
                                    ? const Icon(
                                        Icons.warning_amber_rounded,
                                        size: 20,
                                        color: AppColors.red,
                                      )
                                    : const SizedBox(),
                                const SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: loginLogic.showPass,
                                    child: Icon(
                                      !loginLogic.showPassword
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off_outlined,
                                      color: AppColors.tertiary,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          if (loginLogic.errorPassword.isNotEmpty)
                            Text(loginLogic.errorPassword,
                                style: TextStyle(
                                  color: AppColors.red,
                                  fontSize: 14,
                                  fontFamily: Assets.googleFonts.montserratBold,
                                  fontWeight: FontWeight.bold,
                                ))
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/view_stack');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Text('Đăng nhập',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontFamily: Assets.googleFonts.montserratBold,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Bạn chưa có tài khoản? ',
                        style: TextStyle(
                          color: AppColors.tertiary,
                          fontSize: 15,
                          fontFamily: Assets.googleFonts.montserratBold,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: 'Đăng ký ngay',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 15,
                          fontFamily: Assets.googleFonts.montserratBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ])),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
