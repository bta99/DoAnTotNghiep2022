part of 'timekeeping.dart';

class TimeKeepingLogic extends ChangeNotifier {
  late BuildContext context;
  TimeKeepingLogic({required this.context});
  String currentDateShow = DateTime.now().day.toString() +
      '/' +
      DateTime.now().month.toString() +
      '/' +
      DateTime.now().year.toString();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickerDate != null && pickerDate != DateTime.now()) {
      currentDateShow = pickerDate.day.toString() +
          '/' +
          pickerDate.month.toString() +
          '/' +
          pickerDate.year.toString();
      notifyListeners();
    }
  }
}
