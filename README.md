# Jalali date picker - Gregorian date picker - Time picker

Jalali (Persian - Farsi - Shamsi) date picker & Gregorian date picker & Time picker all with cupertino style and responsive UI.

[![Version](https://img.shields.io/pub/v/ir_datetime_picker?color=007AFF)](https://pub.dev/packages/ir_datetime_picker)
![Platform](https://img.shields.io/badge/platform-android%20%7C%20ios%20%7C%20web-brightgreen)

## Banner

![IRDateTimePicker Banner](https://github.com/alikhajavi74/ir_datetime_picker/raw/master/banner.png)


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

// Simple jalali date picker using top level functions showIRJalaliDatePickerDialog or showIRJalaliDatePickerRoute:
// NOTE: For create your own JalaliDatePicker use IRJalaliDatePicker widget.
ElevatedButton(
  child: const Text("انتخاب تاریخ"),
  onPressed: () async {
    Jalali? selectedDate = await showIRJalaliDatePickerDialog(
      context: context,
      title: "انتخاب تاریخ",
      visibleTodayButton: true,
      todayButtonText: "انتخاب امروز",
      confirmButtonText: "تایید",
      initialDate: Jalali(1400, 4, 2),
    );
    if (selectedDate != null) {
      setState(() {
        _jalaliDate = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
      });
    }
  },
),


// Simple gregorian date picker using top level functions showIRGregorianDatePickerDialog or showIRGregorianDatePickerRoute:
// NOTE: For create your own GregorianDatePicker use IRGregorianDatePicker widget.
ElevatedButton(
  child: const Text("انتخاب تاریخ"),
  onPressed: () async {
    Gregorian? selectedDate = await showIRGregorianDatePickerDialog(
      context: context,
      title: "انتخاب تاریخ",
      visibleTodayButton: true,
      todayButtonText: "انتخاب امروز",
      confirmButtonText: "تایید",
      initialDate: Gregorian(2020, 7, 15),
    );
    if (selectedDate != null) {
      setState(() {
        _gregorianDate = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
      });
    }
  },
),


// Simple time picker using top level function showIRTimePickerDialog:
// NOTE: For create your own TimePicker use IRTimePicker widget.
ElevatedButton(
  child: const Text("انتخاب زمان"),
  onPressed: () async {
    IRTimeModel? time = await showIRTimePickerDialog(
      context: context,
      initialTime: IRTimeModel(hour: 18, minute: 59),
      title: "انتخاب زمان",
      visibleNowButton: true,
      nowButtonText: "انتخاب اکنون",
      confirmButtonText: "تایید",
    );
    if (time != null) {
      setState(() {
        _time = time.toString();
      });
    }
  },
),


// You can create your own date picker with IRJalaliDatePicker or IRGregorianDatePicker widgets:
Container(
  color: Colors.green.withOpacity(0.1),
  child: IRJalaliDatePicker(
    initialDate: Jalali(1400, 1, 3),
    minYear: 1390,
    maxYear: 1420,
    visibleTodayButton: true,
    todayButtonText: "انتخاب اکنون",
    constraints: const BoxConstraints.tightFor(width: 400, height: 200),
    onSelected: (Jalali date) {
      if (kDebugMode) {
        print(date.toString());
      }
    },
  ),
),

```

## Support

If you have any issues or questions, please don't hesitate to reach out to us at Alikhajavi74@gmail.com

https://github.com/alikhajavi74