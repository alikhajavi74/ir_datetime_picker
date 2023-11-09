import 'package:shamsi_date/shamsi_date.dart';

/// NOTES:
/// [IRJalaliDateHelper] helpers for working with Jalali date.
/// [IRGregorianDateHelper] helpers for working with Gregorian date.

// --------------------------------------------------------------------------------------------------------------------

// IRJalaliDateHelper:

class IRJalaliDateHelper {
  static List<String> months = ["فروردین", "اردیبهشت", "خرداد", "تیر", "مرداد", "شهریور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند"];

  static String getMonthName({required int monthNumber}) {
    switch (monthNumber) {
      case 1:
        return "فروردین";
      case 2:
        return "اردیبهشت";
      case 3:
        return "خرداد";
      case 4:
        return "تیر";
      case 5:
        return "مرداد";
      case 6:
        return "شهریور";
      case 7:
        return "مهر";
      case 8:
        return "آبان";
      case 9:
        return "آذر";
      case 10:
        return "دی";
      case 11:
        return "بهمن";
      case 12:
        return "اسفند";
      default:
        throw DateException("Invalid month number($monthNumber)");
    }
  }

  static int getMonthNumber({required String monthName}) {
    switch (monthName) {
      case "فروردین":
        return 1;
      case "اردیبهشت":
        return 2;
      case "خرداد":
        return 3;
      case "تیر":
        return 4;
      case "مرداد":
        return 5;
      case "شهریور":
        return 6;
      case "مهر":
        return 7;
      case "آبان":
        return 8;
      case "آذر":
        return 9;
      case "دی":
        return 10;
      case "بهمن":
        return 11;
      case "اسفند":
        return 12;
      default:
        throw DateException("Invalid month name($monthName)");
    }
  }

  static String getWeekDayName({required int weekDayNumber}) {
    switch (weekDayNumber) {
      case 1:
        return "شنبه";
      case 2:
        return "یکشنبه";
      case 3:
        return "دوشنبه";
      case 4:
        return "سه" "\u200c" "شنبه";
      case 5:
        return "چهارشنبه";
      case 6:
        return "پنج" "\u200c" "شنبه";
      case 7:
        return "جمعه";
      default:
        throw DateException("Invalid week day number($weekDayNumber)");
    }
  }

  static int getWeekDayNumber({required String weekDayName}) {
    switch (weekDayName) {
      case "شنبه":
        return 1;
      case "یکشنبه":
        return 2;
      case "دوشنبه":
        return 3;
      case "دو شنبه":
        return 3;
      case "سه" "\u200c" "شنبه":
        return 4;
      case "سه شنبه":
        return 4;
      case "چهارشنبه":
        return 5;
      case "چهار شنبه":
        return 5;
      case "پنج" "\u200c" "شنبه":
        return 6;
      case "پنج شنبه":
        return 6;
      case "جمعه":
        return 7;
      default:
        throw DateException("Invalid week day name($weekDayName)");
    }
  }

  static int getMonthLength({required int year, required int month}) {
    return Jalali(year, month).monthLength;
  }

  static Jalali getNow() {
    return Jalali.now();
  }
}

// --------------------------------------------------------------------------------------------------------------------

// IRGregorianDateHelper:

class IRGregorianDateHelper {
  static List<String> months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];

  static String getMonthName({required int monthNumber}) {
    switch (monthNumber) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        throw DateException("Invalid month number($monthNumber)");
    }
  }

  static int getMonthNumber({required String monthName}) {
    switch (monthName) {
      case "January":
        return 1;
      case "February":
        return 2;
      case "March":
        return 3;
      case "April":
        return 4;
      case "May":
        return 5;
      case "June":
        return 6;
      case "July":
        return 7;
      case "August":
        return 8;
      case "September":
        return 9;
      case "October":
        return 10;
      case "November":
        return 11;
      case "December":
        return 12;
      default:
        throw DateException("Invalid month name($monthName)");
    }
  }

  static String getWeekDayName({required int weekDayNumber}) {
    switch (weekDayNumber) {
      case 1:
        return "Saturday";
      case 2:
        return "Sunday";
      case 3:
        return "Monday";
      case 4:
        return "Tuesday";
      case 5:
        return "Wednesday";
      case 6:
        return "Thursday";
      case 7:
        return "Friday";
      default:
        throw DateException("Invalid week day number($weekDayNumber)");
    }
  }

  static int getWeekDayNumber({required String weekDayName}) {
    switch (weekDayName) {
      case "Saturday":
        return 1;
      case "Sunday":
        return 2;
      case "Monday":
        return 3;
      case "Tuesday":
        return 4;
      case "Wednesday":
        return 5;
      case "Thursday":
        return 6;
      case "Friday":
        return 7;
      default:
        throw DateException("Invalid week day name($weekDayName)");
    }
  }

  static int getMonthLength({required int year, required int month}) {
    return Gregorian(year, month).monthLength;
  }

  static Gregorian getNow() {
    return Gregorian.now();
  }
}

// --------------------------------------------------------------------------------------------------------------------
