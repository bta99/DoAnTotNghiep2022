import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Widgets/CustomExpansionTile/custom_expanstionTile.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
part 'setting_logic.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late SettingLogic settingLogic;
  @override
  void initState() {
    super.initState();
    settingLogic = SettingLogic(context: context);
  }

  @override
  void dispose() {
    settingLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: settingLogic,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Selector<SettingLogic, Tuple2<bool, bool>>(
                selector: (_, state) =>
                    Tuple2(state.active, state.activeSwitch),
                builder: (_, value, __) {
                  return CustomExpansionTile(
                    onchange: (value) {
                      settingLogic.activeButton();
                    },
                    active: value.item1,
                    leading: Icons.notifications_none_outlined,
                    title: 'Thông báo',
                    children: [
                      ListTile(
                        leading: Text('Cho phép gửi thông báo',
                            style: TextStyle(
                              color: AppColors.textBlack,
                              fontSize: 13,
                              fontFamily: Assets.googleFonts.montserratBold,
                              fontWeight: FontWeight.bold,
                            )),
                        trailing: CupertinoSwitch(
                          value: value.item2,
                          onChanged: (value) {
                            settingLogic.activeButtonSwitch();
                          },
                          activeColor: AppColors.primary,
                        ),
                      ),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
