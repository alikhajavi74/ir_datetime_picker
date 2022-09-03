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
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _date = "Null";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Date: $_date"),
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
            ),
          ],
        ),
      ),
    );
  }
}
