import 'package:intl/intl.dart';

class IRTimeHelper {
  static String getTimeNow() {
    var now = DateTime.now();
    var formatterTime = DateFormat('kk:mm');
    return formatterTime.format(now);
  }
}
