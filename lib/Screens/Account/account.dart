import 'package:doantotnghiep/Config/Colors/colors.dart';
import 'package:doantotnghiep/Screens/ViewStack/view_stack.dart';
import 'package:doantotnghiep/Widgets/LabelCustom/label_textfield_custom.dart';
import 'package:doantotnghiep/Widgets/TextfieldCustom/textfield_custom.dart';
import 'package:doantotnghiep/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

enum gender { nam, nu, khac }

class _AccountScreenState extends State<AccountScreen> {
  late ViewStackLogic viewStackLogic;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtBirthday = TextEditingController();
  TextEditingController txtPhone = TextEditingController();
  TextEditingController txtCMND = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtDiaChi = TextEditingController();
  ValueNotifier<gender> gioitinh = ValueNotifier(gender.nam);
  @override
  void initState() {
    viewStackLogic = context.read<ViewStackLogic>();
    txtName.text = 'Bùi Tuấn Anh';
    txtBirthday.text = '23/09/2001';
    txtPhone.text = '0765829485';
    txtCMND.text = '301764309';
    txtEmail.text = 'tuananhvip1099@gmail.com';
    txtDiaChi.text = 'Long An';
    super.initState();
  }

  @override
  void dispose() {
    viewStackLogic.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Họ tên
              const LabelTextFieldCustom(
                value: 'Họ Tên',
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldCustom(
                controller: txtName,
              ),
              const SizedBox(
                height: 10,
              ),
              //Ngày sinh
              const LabelTextFieldCustom(
                value: 'Ngày sinh',
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldCustom(
                controller: txtBirthday,
              ),
              const SizedBox(
                height: 10,
              ),
              //Giới tính
              const LabelTextFieldCustom(
                value: 'Giới tính',
              ),
              Row(
                children: [
                  ValueListenableBuilder<gender>(
                      valueListenable: gioitinh,
                      builder: (_, value, __) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              toggleable: true,
                              value: gender.nam,
                              groupValue: value,
                              onChanged: (value) {
                                gioitinh.value = gender.nam;
                              },
                            ),
                            const Text('Nam')
                          ],
                        );
                      }),
                  ValueListenableBuilder<gender>(
                      valueListenable: gioitinh,
                      builder: (_, value, __) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio(
                              toggleable: true,
                              value: gender.nu,
                              groupValue: value,
                              onChanged: (value) {
                                gioitinh.value = gender.nu;
                              },
                            ),
                            const Text('Nữ')
                          ],
                        );
                      }),
                ],
              ),
              //Số điện thoại
              const LabelTextFieldCustom(
                value: 'Số điện thoại',
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldCustom(
                controller: txtPhone,
              ),
              const SizedBox(
                height: 10,
              ),
              //Chứng minh nhân dân
              const LabelTextFieldCustom(
                value: 'CMND/CCCD',
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldCustom(
                controller: txtCMND,
              ),
              const SizedBox(
                height: 10,
              ),
              //Email
              const LabelTextFieldCustom(
                value: 'Email',
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldCustom(
                controller: txtEmail,
              ),
              const SizedBox(
                height: 10,
              ),
              //Địa chỉ
              const LabelTextFieldCustom(
                value: 'Quê quán/địa chỉ',
              ),
              const SizedBox(
                height: 5,
              ),
              TextFieldCustom(
                controller: txtDiaChi,
              ),
              const SizedBox(
                height: 10,
              ),
              //Nút lưu
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
                    child: Text('Lưu thông tin',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 14,
                          fontFamily: Assets.googleFonts.montserratBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
