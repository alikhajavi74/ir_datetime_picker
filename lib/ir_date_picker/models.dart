import 'package:shamsi_date/shamsi_date.dart';

import 'utils.dart';

// --------------------------------------------------------------------------------------------------------------------

// CalendarModel:

class CalendarModel {
  int year;
  List<MonthModel> months = [];

  CalendarModel({required this.year}) {
    for (int monthNumber = 1; monthNumber <= 12; monthNumber++) {
      months.add(
        MonthModel(
          year: year,
          monthNumber: monthNumber,
          monthName: getMonthName(monthNumber: monthNumber),
          monthLength: Jalali(year, monthNumber).monthLength,
        ),
      );
    }
  }
}

// --------------------------------------------------------------------------------------------------------------------

// MonthModel:

class MonthModel {
  int year;
  int monthNumber;
  String monthName;
  int monthLength;
  List<Jalali> days = [];

  MonthModel({required this.year, required this.monthNumber, required this.monthName, required this.monthLength}) {
    for (int day = 1; day <= monthLength; day++) {
      days.add(Jalali(year, monthNumber, day));
    }
  }
}

// --------------------------------------------------------------------------------------------------------------------
