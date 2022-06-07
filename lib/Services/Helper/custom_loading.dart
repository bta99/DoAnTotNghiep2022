import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void customLoading(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return Center(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: CupertinoActivityIndicator(),
            ),
          ),
        );
      });
}

void hideLoading(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}
