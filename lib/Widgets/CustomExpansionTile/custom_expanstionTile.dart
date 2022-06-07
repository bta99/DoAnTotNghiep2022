import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final List<Widget>? children;
  final bool? active;
  final Function(bool)? onchange;
  final String title;
  final IconData? leading;
  const CustomExpansionTile({
    this.active,
    this.children,
    this.onchange,
    this.leading,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: AppColors.backgroundColor,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.tertiary,
              offset: Offset.fromDirection(1),
              blurRadius: 0.5,
            ),
          ],
        ),
        child: ExpansionTile(
            onExpansionChanged: onchange,
            iconColor: AppColors.tertiary,
            collapsedIconColor: AppColors.tertiary,
            title: Text(title,
                style: TextStyle(
                  color:
                      active ?? false ? AppColors.primary : AppColors.textBlack,
                  fontSize: 15,
                  fontFamily: Assets.googleFonts.montserratBold,
                  fontWeight: FontWeight.bold,
                )),
            leading: Icon(
              leading,
              color: active ?? false ? AppColors.primary : AppColors.textBlack,
            ),
            children: children ?? []),
      ),
    );
  }
}
