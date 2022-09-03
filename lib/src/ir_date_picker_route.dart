// Copyright (c) 2022, Ali Khajavi (alikhajavi74@gmail.com) All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// IRDatePickerPage widget:

import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:ir_datetime_picker/src/utils/utils.dart';
import 'package:ir_datetime_picker/src/utils/responsive.dart';
import 'package:ir_datetime_picker/src/components/cupertino_picker.dart';
import 'package:ir_datetime_picker/src/components/list_generators.dart';

class IRDatePickerPage extends StatefulWidget {
  final Jalali? initialDate;
  final int? startYear;
  final int? endYear;

  const IRDatePickerPage({
    Key? key,
    this.initialDate,
    this.startYear,
    this.endYear,
  }) : super(key: key);

  @override
  State<IRDatePickerPage> createState() => _IRDatePickerPageState();
}

class _IRDatePickerPageState extends State<IRDatePickerPage> {
  late Jalali _initialDate;

  int _selectedYear = 1400;
  int _selectedMonth = 1;
  int _selectedDay = 1;

  List<int> _years = [];
  final List<String> _months = persianMonths;
  List<int> _days = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    _initialDate = widget.initialDate ?? Jalali.now();
    _selectedYear = _initialDate.year;
    _selectedMonth = _initialDate.month;
    _selectedDay = _initialDate.day;
    _years = generateYearsList(widget.startYear ?? (_initialDate.year - 50),
        widget.endYear ?? (_initialDate.year + 50));
    _days = generateDaysList(getSelectedJalaliDate().monthLength);
  }

  @override
  Widget build(BuildContext context) {
    Widget backButton = IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop<Jalali?>(context, null);
      },
    );
    Widget title = Text(
      "انتخاب تاریخ",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: getResponsiveFontSize(context, 20),
            fontWeight: FontWeight.w700,
          ),
    );
    Widget datePicker = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        generateCupertinoPicker(
          context: context,
          list: _years,
          initialItem: _years.indexOf(_selectedYear),
          onSelectedItemChanged: (selectedIndex) {
            setState(() {
              _selectedYear = _years[selectedIndex];
              int monthLength =
                  getMonthLength(year: _selectedYear, month: _selectedMonth);
              _days = List<int>.generate(monthLength, (index) => index + 1);
              if (_selectedDay > monthLength) {
                _selectedDay = monthLength;
              }
            });
          },
        ),
        generateCupertinoPicker(
          context: context,
          list: _months,
          initialItem:
              _months.indexOf(getMonthName(monthNumber: _selectedMonth)),
          onSelectedItemChanged: (selectedIndex) {
            setState(() {
              _selectedMonth =
                  getMonthNumber(monthName: _months[selectedIndex]);
              int monthLength =
                  getMonthLength(year: _selectedYear, month: _selectedMonth);
              _days = List<int>.generate(monthLength, (index) => index + 1);
              if (_selectedDay > monthLength) {
                _selectedDay = monthLength;
              }
            });
          },
        ),
        generateCupertinoPicker(
          context: context,
          list: _days,
          initialItem: _days.indexOf(_selectedDay),
          onSelectedItemChanged: (selectedIndex) {
            _selectedDay = _days[selectedIndex];
          },
        ),
      ],
    );
    Widget submitButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: getPercentOfWidth(context, 50.0),
          height: getPercentOfHeight(context, 6.0)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 6.0,
          shadowColor: Colors.black38,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(
          "تایید",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: getResponsiveFontSize(context, 14.0),
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop<Jalali?>(context, getSelectedJalaliDate());
        },
      ),
    );
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(width: double.infinity),
              Align(
                alignment: Alignment.topRight,
                child: backButton,
              ),
              SizedBox(height: getPercentOfHeight(context, 2.0)),
              title,
              SizedBox(height: getPercentOfHeight(context, 10.0)),
              datePicker,
              const Spacer(),
              submitButton,
              SizedBox(height: getPercentOfHeight(context, 6.0)),
            ],
          ),
        ),
      ),
    );
  }

  Jalali getSelectedJalaliDate() {
    return Jalali(_selectedYear, _selectedMonth, _selectedDay);
  }
}

// --------------------------------------------------------------------------------------------------------------------

// showIRDatePickerRoute top function:

Future<Jalali?> showIRDatePickerRoute(BuildContext context,
    {Jalali? initialDate, int? startYear, int? endYear}) async {
  Jalali? jalaliDate = await Navigator.of(context).push<Jalali?>(
    MaterialPageRoute(
      builder: (BuildContext buildContext) => IRDatePickerPage(
        initialDate: initialDate,
        startYear: startYear,
        endYear: endYear,
      ),
    ),
  );
  return jalaliDate;
}

// --------------------------------------------------------------------------------------------------------------------
