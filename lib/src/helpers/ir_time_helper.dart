import 'package:intl/intl.dart';

/// [IRTimeHelper] some usefull tools for working with time.

class IRTimeHelper {
  static String getTimeNow() {
    var now = DateTime.now();
    var formatterTime = DateFormat('kk:mm');
    return formatterTime.format(now);
  }
}
