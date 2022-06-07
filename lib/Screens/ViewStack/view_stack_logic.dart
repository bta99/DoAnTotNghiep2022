part of 'view_stack.dart';

class ViewStackLogic extends ChangeNotifier {
  //Tất cả api ở màn hình chính đều call ở class Logic này
  late BuildContext context;

  late DemoService ser;
  ViewStackLogic({required this.context}) {
    ser = DemoService.client();
  }
  List<DemoModels> data = [];

  int index = 0;
  String title = 'Trang Chủ';
  void changeIndexBottomNavBar(value) {
    index = value;
    if (index == 0) {
      title = 'Trang Chủ';
    }
    if (index == 1) {
      title = 'Cài đặt';
    }
    if (index == 2) {
      title = 'Thông tin tài khoản';
    }
    if (index == 3) {
      title = 'Chấm công';
    }
    // callBack();
    notifyListeners();
  }
  // void getApiDemo() async {
  //   try {
  //     data = await ser.getUsers();
  //     notifyListeners();
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  // void callBack() {
  //   if (index == 1 && data.isEmpty) {
  //     getApiDemo();
  //   }
  // }

}
