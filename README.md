# Iranian (persian,farsi,shamsi,jalali) datetime picker for flutter with cupertino style.


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

import 'package:ir_datetime_picker.dart/ir_datetime_picker.dart';

```

Step3: check exmaples to use:

```dart

// use top level function showIRDatePickerRoute like below:

ElevatedButton(
     child: const Text("PickDate"),
     onPressed: () async {
       Jalali? selectedDate = await showIRDatePickerRoute(context);
       if (selectedDate != null) {
         print("${selectedDate.year}/${selectedDate.month}/${selectedDate.day}");
       } else {
         print("No date was selected");
       }
     },
)

```