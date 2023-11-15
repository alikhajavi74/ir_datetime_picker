import 'package:flutter/foundation.dart';

/// * [mPrint] just work in debug mode.

void mPrint(Object object) {
  if (kDebugMode) {
    print(object);
  }
}
