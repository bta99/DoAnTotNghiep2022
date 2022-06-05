part of 'auth.dart';

class AuthLogic extends ChangeNotifier {
  late BuildContext context;
  String checkToken = '';
  AuthLogic({required this.context}) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      initLocalStorage();
    });
  }

  initLocalStorage() async {
    await LocalStorage.init();
    checkToken = LocalStorage().token;
    //kiểm tra đăng nhập hay chưa qua token
    if (checkToken.isEmpty) {
      Future.delayed(const Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, '/login'));
    } else {
      //sau này sẽ call để lấy thông tin user ở đây
      Future.delayed(const Duration(seconds: 2),
          () => Navigator.pushReplacementNamed(context, '/view_stack'));
    }
    notifyListeners();
  }
}
