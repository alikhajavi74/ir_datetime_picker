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
      localizationsDelegates: const [GlobalCupertinoLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
      supportedLocales: const [Locale("fa"), Locale("en")],
      locale: const Locale("fa"),
      debugShowCheckedModeBanner: false,
      title: 'Example',
      theme: ThemeData(fontFamily: "IranSans"),
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
            Text("تاریخ جلالی: $_jalaliDate", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick Jalali date with showIRJalaliDatePickerDialog top function:
            ElevatedButton(
              child: const Text("انتخاب تاریخ"),
              onPressed: () async {
                Jalali? selectedDate = await showIRJalaliDatePickerDialog(
                  context: context,
                  title: "انتخاب تاریخ",
                  todayButtonText: "انتخاب امروز",
                  confirmButtonText: "تایید",
                );
                if (selectedDate != null) {
                  setState(() {
                    _jalaliDate = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),

            Text("تاریخ میلادی: $_gregorianDate", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick Gregorian date with showIRGregorianDatePickerDialog top function:
            ElevatedButton(
              child: const Text("انتخاب تاریخ"),
              onPressed: () async {
                Gregorian? selectedDate = await showIRGregorianDatePickerDialog(
                  context: context,
                  title: "انتخاب تاریخ",
                  todayButtonText: "انتخاب امروز",
                  confirmButtonText: "تایید",
                );
                if (selectedDate != null) {
                  setState(() {
                    _gregorianDate = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),

            Text("زمان: $_time", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick time with showIRTimePickerDialog top function:
            ElevatedButton(
              child: const Text("انتخاب زمان"),
              onPressed: () async {
                IRTimeModel? time = await showIRTimePickerDialog(
                  context: context,
                  title: "انتخاب زمان",
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
          ],
        ),
      ),
    );
  }
}
