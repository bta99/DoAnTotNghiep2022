part of 'setting.dart';

class SettingLogic extends ChangeNotifier {
  late BuildContext context;
  SettingLogic({required this.context});
  bool active = false;
  bool activeSwitch = false;
  void activeButton() {
    active = !active;
    notifyListeners();
  }

  void activeButtonSwitch() {
    activeSwitch = !activeSwitch;
    notifyListeners();
  }
}
