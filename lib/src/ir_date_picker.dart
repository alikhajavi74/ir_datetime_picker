// Copyright (c) 2022, Ali Khajavi (alikhajavi74@gmail.com) All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:ir_datetime_picker/src/components/cupertino_picker.dart';
import 'package:ir_datetime_picker/src/components/list_generators.dart';

// --------------------------------------------------------------------------------------------------------------------
// IRdatePicker widget
class IRDatePicker extends StatefulWidget {
  const IRDatePicker(
      {Key? key,
      this.initialDate,
      this.startYear,
      this.endYear,
      this.onChanged})
      : super(key: key);

  /// Jalali initialized time
  final Jalali? initialDate;

  /// first year that user can select
  final int? startYear;

  /// last year that user can select
  final int? endYear;

  /// onchanged function use to show selected jalali time when user change datepicker
  final Function? onChanged;

  @override
  State<IRDatePicker> createState() => _IRDatePickerState();
}

class _IRDatePickerState extends State<IRDatePicker> {
  late Jalali _initialDate;

  int _selectedYear = 1400;
  int _selectedMonth = 1;
  int _selectedDay = 1;

  List<int> _years = [];
  List<int> _days = [];
  final List<String> _months = persianMonths;

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
    widget.onChanged!(getSelectedJalaliDate());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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

              widget.onChanged!(getSelectedJalaliDate());
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
              widget.onChanged!(getSelectedJalaliDate());
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
            widget.onChanged!(getSelectedJalaliDate());
          },
        ),
      ],
    );
  }

  Jalali getSelectedJalaliDate() {
    return Jalali(_selectedYear, _selectedMonth, _selectedDay);
  }
}
// --------------------------------------------------------------------------------------------------------------------
