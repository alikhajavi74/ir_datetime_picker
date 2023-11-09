import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/ir_datetime_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            Text("SelectedDate: $_date", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick date with IRDatePickerResponsiveDialog:
            ElevatedButton(
              child: const Text("Pick Date"),
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

            Text("SelectedTime: $_time", style: const TextStyle(fontSize: 18.0)),
            const SizedBox(height: 5.0),

            /// Pick time with IRTimePickerResponsiveDialog:
            ElevatedButton(
              child: const Text("Pick Time"),
              onPressed: () async {
                IRTimeModel? time = await showIRTimePickerDialog(context);
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
