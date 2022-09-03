# Iranian date & time picker

Iranian (persian,farsi,shamsi,jalali) datetime picker with cupertino style and responsive ui.


[![Version](https://img.shields.io/pub/v/ir_datetime_picker?color=007AFF)](https://pub.dev/packages/ir_datetime_picker)
![Platform](https://img.shields.io/badge/platform-android%20%7C%20ios-brightgreen)


## Usage

Step1: add dependency to your pubspec.yaml:

```yaml

dependencies:
  ir_datetime_picker: version

```

Step2: import library:

```dart

import 'package:ir_datetime_picker/ir_datetime_picker.dart';

```

Step3: check exmaples to use:

```dart

// use top level function showIRDatePickerRoute like below:

ElevatedButton(
  child: const Text("PickDate"),
  onPressed: () async {
    Jalali? datePicked = await showIRDatePickerRoute(context);
    if (datePicked != null) {
      setState(() {
        _date = "${datePicked.year}/${datePicked.month}/${datePicked.month}";
      });
    }
  },
)

```

## ContactMe

Alikhajavi74@gmail.com

https://github.com/alikhajavi74