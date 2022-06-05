import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Models/demoModels/demo_model.dart';
import 'package:doantotnghiep/Screens/ViewStack/view_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late ViewStackLogic viewStackLogic;
  @override
  void initState() {
    viewStackLogic = context.read<ViewStackLogic>();
    super.initState();
  }

  @override
  void dispose() {
    viewStackLogic.dispose();
    super.dispose();
  }

  ValueNotifier<List<bool>> lstButton =
      ValueNotifier([for (int i = 0; i <= 100; i++) false]);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: viewStackLogic,
        child: Scaffold(
          body: Selector<ViewStackLogic, List<DemoModels>>(
            selector: (_, state) => state.data,
            builder: (_, value, __) {
              return value.isEmpty
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : ListView(
                      children: List.generate(
                      value.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Theme(
                          data: ThemeData(backgroundColor: AppColors.white),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.backgroundColor),
                            child: ExpansionTile(
                              controlAffinity: ListTileControlAffinity.trailing,
                              subtitle: Text(value[index].title),
                              childrenPadding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              title: Text(
                                value[index].id.toString(),
                              ),
                              children: [
                                Text(value[index].body),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ));
            },
          ),
        ));
  }
}
