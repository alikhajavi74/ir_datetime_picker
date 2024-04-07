import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ir_datetime_picker/ir_datetime_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [Locale("fa"), Locale("en")],
      locale: const Locale("fa"),
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(
        fontFamily: "IranSans",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _jalaliDate = "Null";
  String _gregorianDate = "Null";
  String _time = "Null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("تاریخ جلالی: $_jalaliDate",
                style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

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
                    _jalaliDate =
                        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),

            Text("تاریخ میلادی: $_gregorianDate",
                style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

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
                    _gregorianDate =
                        "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),

            Text("زمان: $_time", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            // Simple time picker using top level function showIRTimePickerDialog:
            // NOTE: For create your own TimePicker use IRTimePicker widget.
            ElevatedButton(
              child: const Text("انتخاب زمان"),
              onPressed: () async {
                IRTimeModel? selectedTime = await showIRTimePickerDialog(
                  context: context,
                  initialTime: IRTimeModel(hour: 18, minute: 45, second: 59),
                  title: "انتخاب زمان",
                  visibleSecondsPicker: true,
                  visibleNowButton: true,
                  nowButtonText: "انتخاب اکنون",
                  confirmButtonText: "تایید",
                );
                if (selectedTime != null) {
                  setState(() {
                    _time = selectedTime.toString(showSecond: true);
                    Duration durationTime = selectedTime.toDuration();
                    if (kDebugMode)
                      print('Duration: ${durationTime.toString()}');
                    if (kDebugMode)
                      print(
                          'IRTimeModel: ${IRTimeModel.fromDuration(durationTime).toString(showSecond: true)}');
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),

            // Sample IRJalaliDatePicker widget For create your own JalaliDatePicker.
            Container(
              color: Colors.green.withOpacity(0.1),
              child: IRJalaliDatePicker(
                initialDate: Jalali(1400, 1, 3),
                minYear: 1390,
                maxYear: 1420,
                visibleTodayButton: true,
                todayButtonText: "انتخاب اکنون",
                constraints:
                    const BoxConstraints.tightFor(width: 400, height: 200),
                onSelected: (Jalali date) {
                  if (kDebugMode) print(date.toString());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
