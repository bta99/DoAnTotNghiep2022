part of 'login.dart';

class LoginLogic extends ChangeNotifier {
  late BuildContext context;
  LoginLogic({required this.context});
  late final TextEditingController txtEmail = TextEditingController(text: '');
  late final TextEditingController txtPassword =
      TextEditingController(text: '');
  String errorEmail = '';
  String errorPassword = '';
  bool showPassword = false;

  void validateEmail(String email) {
    if (!email.isEmail() && email.trim().isNotEmpty) {
      errorEmail = 'Email không hợp lệ';
    } else if (email.trim().isEmpty) {
      errorEmail = '';
      if (email.contains(' ')) {
        errorEmail = 'Email không chứa khoảng trắng';
      }
    } else {
      errorEmail = '';
      if (email.contains(' ')) {
        errorEmail = 'Email không chứa khoảng trắng';
      }
    }
    txtEmail.text = email;
    notifyListeners();
  }

  void validatePass(String pass) {
    if (pass.trim().length < 6 && pass.trim().isNotEmpty) {
      errorPassword = 'Mật khẩu tối thiểu 6 kí tự';
      if (pass.contains(' ')) {
        errorPassword = 'Mật khẩu không chứa khoảng trắng';
      }
    } else if (pass.trim().isEmpty) {
      errorPassword = '';
      if (pass.contains(' ')) {
        errorPassword = 'Mật khẩu không chứa khoảng trắng';
      }
    } else {
      errorPassword = '';
      if (pass.contains(' ')) {
        errorPassword = 'Mật khẩu không chứa khoảng trắng';
      }
    }
    txtPassword.text = pass;
    notifyListeners();
  }

  void showPass() {
    showPassword = !showPassword;
    notifyListeners();
  }
}
