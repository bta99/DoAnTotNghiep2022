import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Widgets/LabelCustom/label_textfield_custom.dart';
import 'package:doantotnghiep/Widgets/TextfieldCustom/textfield_custom.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
part 'timekeeping_logic.dart';

class TimekeepingSceen extends StatefulWidget {
  const TimekeepingSceen({Key? key}) : super(key: key);

  @override
  State<TimekeepingSceen> createState() => _TimekeepingSceenState();
}

class _TimekeepingSceenState extends State<TimekeepingSceen> {
  late TimeKeepingLogic timeKeepingLogic;
  @override
  void initState() {
    super.initState();
    timeKeepingLogic = TimeKeepingLogic(context: context);
  }

  @override
  void dispose() {
    timeKeepingLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: timeKeepingLogic,
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelTextFieldCustom(
                    value: 'Vui lòng chọn ngày chấm công',
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Selector<TimeKeepingLogic, String>(
                    selector: (_, state) => state.currentDateShow,
                    builder: (_, value, __) {
                      return InkWell(
                        onTap: () {
                          timeKeepingLogic.selectDate(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.primary,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(value,
                                  style: TextStyle(
                                    color: AppColors.textBlack,
                                    fontSize: 15,
                                    fontFamily:
                                        Assets.googleFonts.montserratBold,
                                    fontWeight: FontWeight.bold,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    timeKeepingLogic.selectDate(context);
                                  },
                                  icon: const Icon(
                                    Icons.date_range_outlined,
                                    color: AppColors.textBlack,
                                  ))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
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
