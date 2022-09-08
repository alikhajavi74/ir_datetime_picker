import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/utils/responsive.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'utils/utils.dart';

// --------------------------------------------------------------------------------------------------------------------

// IRDatePicker widget:

class IRDatePicker extends StatefulWidget {
  final Jalali? initialDate;
  final int? startYear;
  final int? endYear;
  final String? title;
  final Widget? backButtonIcon;
  final Widget? submitButton;

  const IRDatePicker({
    Key? key,
    this.initialDate,
    this.startYear,
    this.endYear,
    this.title,
    this.backButtonIcon,
    this.submitButton,
  }) : super(key: key);

  @override
  State<IRDatePicker> createState() => _IRDatePickerState();
}

class _IRDatePickerState extends State<IRDatePicker> {
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
    _years = generateYearsList(widget.startYear ?? (_initialDate.year - 50), widget.endYear ?? (_initialDate.year + 50));
    _days = generateDaysList(getSelectedJalaliDate().monthLength);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    Widget backButton = IconButton(
      icon: widget.backButtonIcon ?? const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop<Jalali?>(context, null);
      },
    );
    Widget title = Text(
      widget.title ?? "انتخاب تاریخ",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 20.0.rf(context),
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
              int monthLength = getMonthLength(year: _selectedYear, month: _selectedMonth);
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
          initialItem: _months.indexOf(getMonthName(monthNumber: _selectedMonth)),
          onSelectedItemChanged: (selectedIndex) {
            setState(() {
              _selectedMonth = getMonthNumber(monthName: _months[selectedIndex]);
              int monthLength = getMonthLength(year: _selectedYear, month: _selectedMonth);
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
      constraints: BoxConstraints.tightFor(width: 50.0.w(context), height: 6.0.h(context)),
      child: InkWell(
        child: Material(
          color: themeData.primaryColor,
          elevation: 6.0,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Center(
            child: Text(
              "تایید",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14.0.rf(context), fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ),
        onTap: () => Navigator.pop<Jalali?>(context, getSelectedJalaliDate()),
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
              SizedBox(height: 2.0.h(context)),
              title,
              SizedBox(height: 10.0.h(context)),
              datePicker,
              const Spacer(),
              submitButton,
              SizedBox(height: 6.0.h(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget generateCupertinoPicker({required BuildContext context, required List list, required int initialItem, required ValueChanged<int> onSelectedItemChanged}) {
    return SizedBox(
      width: 30.0.w(context),
      height: 30.0.h(context),
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: 8.5.w(context),
        diameterRatio: 1.0,
        selectionOverlay: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.grey.shade400, width: 0.5),
              bottom: BorderSide(color: Colors.grey.shade400, width: 0.5),
            ),
          ),
        ),
        onSelectedItemChanged: onSelectedItemChanged,
        children: list.map<Widget>((element) {
          return Center(
            child: Text(element.toString(), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.0.rf(context))),
          );
        }).toList(),
      ),
    );
  }

  List<int> generateYearsList(int startYear, int endYear) {
    List<int> years = [];
    for (int i = startYear; i <= endYear; i++) {
      years.add(i);
    }
    return years;
  }

  List<int> generateDaysList(int monthLength) {
    return List<int>.generate(monthLength, (index) => index + 1);
  }

  Jalali getSelectedJalaliDate() {
    return Jalali(_selectedYear, _selectedMonth, _selectedDay);
  }
}

// --------------------------------------------------------------------------------------------------------------------

// showIRDatePickerRoute top function:

Future<Jalali?> showIRDatePickerRoute(BuildContext context, {Jalali? initialDate, int? startYear, int? endYear}) async {
  Jalali? jalaliDate = await Navigator.of(context).push<Jalali?>(
    MaterialPageRoute(
      builder: (BuildContext buildContext) => IRDatePicker(
        initialDate: initialDate,
        startYear: startYear,
        endYear: endYear,
      ),
    ),
  );
  return jalaliDate;
}

// --------------------------------------------------------------------------------------------------------------------
