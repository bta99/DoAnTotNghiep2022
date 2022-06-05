import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final String? placeholder;
  final Widget? suFFixIcon;
  final Widget? preFixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool? errorBorder;
  final bool? typePassword;

  const TextFieldCustom({
    this.placeholder,
    this.preFixIcon,
    this.suFFixIcon,
    this.controller,
    this.onChanged,
    this.errorBorder,
    this.typePassword,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        style: TextStyle(
          color: AppColors.textBlack,
          fontSize: 14,
          fontFamily: Assets.googleFonts.montserratBold,
        ),
        obscureText: typePassword ?? false,
        onChanged: onChanged,
        decoration: InputDecoration(
          suffixIcon: suFFixIcon,
          // InkWell(
          //     onTap: () {},
          //     child: const Icon(
          //       Icons.close,
          //       size: 20,
          //       color: AppColors.textTertiary,
          //     )),
          // Row(
          //   mainAxisSize: MainAxisSize.min,
          //   children: [
          //     InkWell(
          //         onTap: () {},
          //         child: const Icon(
          //           Icons.close,
          //           size: 20,
          //           color: AppColors.textTertiary,
          //         )),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //     InkWell(
          //         onTap: () {},
          //         child:
          //             const Icon(Icons.remove_red_eye_outlined)),
          //     const SizedBox(
          //       width: 10,
          //     ),
          //   ],
          // ),
          hintText: placeholder,
          hintStyle: TextStyle(
            color: AppColors.textLightGray,
            fontSize: 14,
            fontFamily: Assets.googleFonts.montserratBold,
            fontWeight: FontWeight.bold,
          ),
          contentPadding: const EdgeInsets.only(left: 10),
          border: const OutlineInputBorder(
              gapPadding: 1,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: errorBorder ?? false ? AppColors.red : AppColors.primary,
                width: 2,
              ),
              gapPadding: 1,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          focusedBorder: errorBorder ?? false
              ? const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.red,
                    width: 2,
                  ),
                  gapPadding: 1,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)))
              : null,
        ),
      ),
    );
  }
}
