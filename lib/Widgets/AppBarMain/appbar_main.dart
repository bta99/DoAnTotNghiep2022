import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:flutter/material.dart';

AppBar appBarMain(
  String avatar,
  Widget title,
) {
  return AppBar(
    backgroundColor: AppColors.white,
    // elevation: 0.0,
    title: title,
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 158, 182, 245),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(image: AssetImage(avatar))),
        ),
      ),
    ],
  );
}
