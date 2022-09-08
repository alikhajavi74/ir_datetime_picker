// Some utilities for project

import 'package:flutter/foundation.dart';
import 'package:shamsi_date/shamsi_date.dart';

// --------------------------------------------------------------------------------------------------------------------

// TopFields:

const List<String> persianMonths = ["فروردین", "اردیبهشت", "خرداد", "تیر", "مرداد", "شهریور", "مهر", "آبان", "آذر", "دی", "بهمن", "اسفند"];

// --------------------------------------------------------------------------------------------------------------------

// TopFunctions:

String getMonthName({required int monthNumber}) {
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
      throw DateException("عدد ماه نامعتبر است");
  }
}

int getMonthNumber({required String monthName}) {
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
      throw DateException("اسم ماه نامعتبر است");
  }
}

String getWeekDayName({required int weekDayNumber}) {
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
      throw DateException("عدد روز هفته نامعتبر است");
  }
}

int getWeekDayNumber({required String weekDayName}) {
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
      throw DateException("نام روز هفته نامعتبر است");
  }
}

int getMonthLength({required int year, required int month}) {
  return Jalali(year, month).monthLength;
}

void mPrint(Object object) {
  if (kDebugMode) {
    print(object);
  }
}

// --------------------------------------------------------------------------------------------------------------------
