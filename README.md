# Iranian date & time picker

Iranian (persian,farsi,shamsi,jalali) datetime picker with cupertino style and responsive ui.


[![Version](https://img.shields.io/pub/v/ir_datetime_picker?color=007AFF)](https://pub.dev/packages/ir_datetime_picker)
![Platform](https://img.shields.io/badge/platform-android%20%7C%20ios-brightgreen)

## Demo:
![Demo](https://github.com/alikhajavi74/ir_datetime_picker/blob/master/demo/demo.gif)


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

Step3: check exmaple to use:

```dart

/// Pick date with IRDatePickerResponsiveDialog:
ElevatedButton(
  child: const Text("pick date with dialog"),
  onPressed: () async {
    Jalali? selectedDate = await showIRDatePickerDialog(context, enableTodayButton: true);
    if (selectedDate != null) {
      setState(() {
        _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
      });
    }
  },
)


/// Pick date with IRDatePickerResponsiveRoute:
ElevatedButton(
  child: const Text("pick date with route"),
  onPressed: () async {
    Jalali? selectedDate = await showIRDatePickerRoute(context, enableTodayButton: true);
    if (selectedDate != null) {
      setState(() {
        _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
      });
    }
  },
)

/// You can create your own date picker with IRDatePicker widget:
const Text("use as custom:", style: TextStyle(fontSize: 18.0)),
Directionality(
  textDirection: TextDirection.rtl,
  child: IRDatePicker(
    startYear: 1380,
    endYear: 1420,
    initialDate: Jalali(1400, 6, 12),
    enableTodayButton: true,
    todayButtonText: "برو به امروز",
    onSelected: (Jalali selectedDate) {
      setState(() {
        _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
      });
    },
  ),
)

```

## ContactMe

Alikhajavi74@gmail.com

https://github.com/alikhajavi74