import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class LabelTextFieldCustom extends StatelessWidget {
  final String value;
  const LabelTextFieldCustom({
    required this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(
            text: '$value ',
            style: TextStyle(
              color: AppColors.textBlack,
              fontSize: 14,
              fontFamily: Assets.googleFonts.montserratBold,
              fontWeight: FontWeight.bold,
            )),
        const TextSpan(
            text: '*',
            style: TextStyle(
              color: AppColors.red,
            )),
      ],
    ));
  }
}
