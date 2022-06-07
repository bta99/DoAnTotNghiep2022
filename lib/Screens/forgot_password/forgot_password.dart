import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Screens/Login/login.dart';
import 'package:doantotnghiep/Widgets/TextfieldCustom/textfield_custom.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          appBar: AppBar(
            backgroundColor: AppColors.transparent,
            elevation: 0.0,
            centerTitle: true,
            title: Text('Quên mật khẩu',
                style: TextStyle(
                  color: AppColors.textBlack,
                  fontSize: 17,
                  fontFamily: Assets.googleFonts.montserratBold,
                  fontWeight: FontWeight.bold,
                )),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.textBlack,
                  size: 16,
                )),
          ),
          body: Center(
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
                    'Quên mật khẩu',
                    style: TextStyle(
                      color: AppColors.textBlack,
                      fontSize: 25,
                      fontFamily: Assets.googleFonts.montserratBold,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Vui lòng nhập email đã đăng ký tài khoản,chúng tôi sẽ gửi mã xác nhận để bạn đặt lại mật khẩu.',
                    style: TextStyle(
                      color: AppColors.textBlack,
                      fontSize: 13,
                      fontFamily: Assets.googleFonts.montserratBold,
                    ),
                    textAlign: TextAlign.center,
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                      child: Center(
                        child: Text('Gửi mã xác nhận',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 14,
                              fontFamily: Assets.googleFonts.montserratBold,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
