import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Models/demoModels/demo_model.dart';
import 'package:doantotnghiep/Screens/Account/account.dart';
import 'package:doantotnghiep/Screens/HomePage/home.dart';
import 'package:doantotnghiep/Screens/Setting/setting.dart';
import 'package:doantotnghiep/Screens/TimekeepingTimekeeping/timekeeping.dart';
import 'package:doantotnghiep/Services/Api/demoCallApi/demo.dart';
import 'package:doantotnghiep/Widgets/AppBarMain/appbar_main.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
part 'view_stack_logic.dart';

class ViewStack extends StatefulWidget {
  const ViewStack({Key? key}) : super(key: key);

  @override
  State<ViewStack> createState() => _ViewStackState();
}

class _ViewStackState extends State<ViewStack> {
  List<Widget> page = [
    const HomePage(),
    const SettingScreen(),
    const AccountScreen(),
    const TimekeepingSceen(),
  ];
  late ViewStackLogic viewStackLogic;
  @override
  void initState() {
    viewStackLogic = ViewStackLogic(context: context);
    super.initState();
  }

  @override
  void dispose() {
    viewStackLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: ChangeNotifierProvider.value(
        value: viewStackLogic,
        child: Scaffold(
          appBar: appBarMain(
            Assets.images.avatar.path,
            Selector<ViewStackLogic, String>(
              selector: (_, state) => state.title,
              builder: (_, value, __) {
                return Text(
                  value,
                  style: TextStyle(
                    color: AppColors.acne4,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: Assets.googleFonts.montserratBold,
                  ),
                );
              },
            ),
            leading: Selector<ViewStackLogic, int>(
              selector: (_, state) => state.index,
              builder: (_, value, __) {
                return value == 2
                    ? IconButton(
                        onPressed: () {
                          viewStackLogic.changeIndexBottomNavBar(0);
                          FocusScope.of(context).unfocus();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.textBlack,
                          size: 15,
                        ))
                    : const SizedBox();
              },
            ),
          ),
          body: Selector<ViewStackLogic, int>(
            selector: (_, state) => state.index,
            builder: (_, value, __) {
              return IndexedStack(
                index: viewStackLogic.index,
                children: page,
              );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.startDocked,
          floatingActionButton: Selector<ViewStackLogic, int>(
            selector: (_, state) => state.index,
            builder: (_, value, __) {
              return value != 2
                  ? FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      //mini: true,
                      child: const Icon(Icons.house_outlined),
                      onPressed: () {
                        viewStackLogic.changeIndexBottomNavBar(0);
                      },
                    )
                  : const SizedBox();
            },
          ),
          bottomNavigationBar: Selector<ViewStackLogic, int>(
            selector: (_, state) => state.index,
            builder: (_, value, __) {
              return value != 2
                  ? BottomAppBar(
                      elevation: 10.0,
                      color: AppColors.backgroundColor,
                      shape: const CircularNotchedRectangle(),
                      notchMargin: 7.0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          //mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                viewStackLogic.changeIndexBottomNavBar(0);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    color: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                viewStackLogic.changeIndexBottomNavBar(3);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color:
                                          value == 3 ? AppColors.primary : null,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.featured_play_list_outlined,
                                      color: value == 3
                                          ? AppColors.white
                                          : AppColors.textTertiary,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Chấm công',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          Assets.googleFonts.montserratBold,
                                      color: value == 3
                                          ? AppColors.primary
                                          : AppColors.textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                viewStackLogic.changeIndexBottomNavBar(1);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color:
                                          value == 1 ? AppColors.primary : null,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.settings_outlined,
                                      color: value == 1
                                          ? AppColors.white
                                          : AppColors.textTertiary,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Cài đặt',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          Assets.googleFonts.montserratBold,
                                      color: value == 1
                                          ? AppColors.primary
                                          : AppColors.textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                viewStackLogic.changeIndexBottomNavBar(2);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 35,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      color:
                                          value == 2 ? AppColors.primary : null,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.account_circle_outlined,
                                      color: value == 2
                                          ? AppColors.white
                                          : AppColors.textTertiary,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Tài khoản',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily:
                                          Assets.googleFonts.montserratBold,
                                      color: value == 2
                                          ? AppColors.primary
                                          : AppColors.textTertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
