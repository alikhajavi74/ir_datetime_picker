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
      locale: const Locale("en"),
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
  String _date = "Null";
  String _time = "Null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Picked date: $_date", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick date with IRDatePickerResponsiveDialog:
            ElevatedButton(
              child: const Text("Pick date"),
              onPressed: () async {
                Jalali? selectedDate = await showIRDatePickerRoute(context, enableTodayButton: true);
                if (selectedDate != null) {
                  setState(() {
                    _date = "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}";
                  });
                }
              },
            ),
            const SizedBox(height: 30.0),

            Text("Picked time: $_time", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick time with IRTimePickerResponsiveDialog:
            ElevatedButton(
              child: const Text("Pick time"),
              onPressed: () async {
                IRTimeModel? time = await showIRTimePickerDialog(context: context, language: IRTimeLanguage.english);
                if (time != null) {
                  setState(() {
                    _time = time.toString();
                  });
                }
              },
            ),
            ElevatedButton(
              child: const Text("انتخاب زمان"),
              onPressed: () async {
                IRTimeModel? time = await showIRTimePickerDialog(context: context, language: IRTimeLanguage.persian);
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
