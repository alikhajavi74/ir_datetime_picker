import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/ir_date_helper.dart';
import 'package:ir_datetime_picker/src/helpers/print.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:shamsi_date/shamsi_date.dart';

typedef IRDatePickerOnSelected = void Function(Jalali jalaliDate);

class IRDatePicker extends StatefulWidget {
  final Jalali? initialDate;
  final int? startYear;
  final int? endYear;
  final bool? enableTodayButton;
  final String? todayButtonText;
  final IRDatePickerOnSelected onSelected;

  const IRDatePicker({
    Key? key,
    this.initialDate,
    this.startYear,
    this.endYear,
    this.enableTodayButton,
    this.todayButtonText,
    required this.onSelected,
  }) : super(key: key);

  @override
  State<IRDatePicker> createState() => _IRDatePickerState();
}

class _IRDatePickerState extends State<IRDatePicker> {
  late Jalali _initialDate;
  late bool _refreshCupertinoPickers;

  int _selectedYear = 1400;
  int _selectedMonth = 1;
  int _selectedDay = 1;

  List<int> _years = [];
  final List<String> _months = IRShamsiDateHelper.months;
  List<int> _days = [];

  @override
  void initState() {
    super.initState();
    _initialDate = widget.initialDate ?? Jalali.now();
    _refreshCupertinoPickers = false;
    _selectedYear = _initialDate.year;
    _selectedMonth = _initialDate.month;
    _selectedDay = _initialDate.day;
    _years = generateYearsList(widget.startYear ?? (_initialDate.year - 50), widget.endYear ?? (_initialDate.year + 50));
    _days = generateDaysList(getSelectedJalaliDate().monthLength);
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshCupertinoPickers = false;
    });
    Widget cupertinoPickers = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        generateCupertinoPicker(
          context: context,
          list: _years,
          initialItem: _years.indexOf(_selectedYear),
          onSelectedItemChanged: (selectedIndex) {
            setState(() {
              _selectedYear = _years[selectedIndex];
              int monthLength = IRShamsiDateHelper.getMonthLength(year: _selectedYear, month: _selectedMonth);
              _days = List<int>.generate(monthLength, (index) => index + 1);
              if (_selectedDay > monthLength) {
                _selectedDay = monthLength;
              }
            });
            widget.onSelected(getSelectedJalaliDate());
          },
        ),
        generateCupertinoPicker(
          context: context,
          list: _months,
          initialItem: _months.indexOf(IRShamsiDateHelper.getMonthName(monthNumber: _selectedMonth)),
          onSelectedItemChanged: (selectedIndex) {
            setState(() {
              _selectedMonth = IRShamsiDateHelper.getMonthNumber(monthName: _months[selectedIndex]);
              int monthLength = IRShamsiDateHelper.getMonthLength(year: _selectedYear, month: _selectedMonth);
              _days = List<int>.generate(monthLength, (index) => index + 1);
              if (_selectedDay > monthLength) {
                _selectedDay = monthLength;
              }
            });
            widget.onSelected(getSelectedJalaliDate());
          },
        ),
        generateCupertinoPicker(
          context: context,
          list: _days,
          initialItem: _days.indexOf(_selectedDay),
          onSelectedItemChanged: (selectedIndex) {
            _selectedDay = _days[selectedIndex];
            widget.onSelected(getSelectedJalaliDate());
          },
        ),
      ],
    );
    Widget todayButton = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 1.0.percentOfHeight(context)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.percentOfWidth(context)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.info),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(2.0.percentOfWidth(context)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                label: Text(widget.todayButtonText ?? "انتخاب امروز", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor, fontSize: 14.0.responsiveFont(context))),
                onPressed: () {
                  setState(() {
                    _refreshCupertinoPickers = true;
                    Jalali now = Jalali.now();
                    _selectedYear = now.year;
                    _selectedMonth = now.month;
                    _selectedDay = now.day;
                  });
                  widget.onSelected(getSelectedJalaliDate());
                },
              ),
            ],
          ),
        ),
      ],
    );
    return Column(
      children: [
        cupertinoPickers,
        (widget.enableTodayButton ?? true) ? todayButton : const SizedBox.shrink(),
      ],
    );
  }

  Widget generateCupertinoPicker({required BuildContext context, required List list, required int initialItem, required ValueChanged<int> onSelectedItemChanged}) {
    mPrint(initialItem);
    return SizedBox(
      width: 30.0.percentOfWidth(context),
      height: 30.0.percentOfHeight(context),
      child: CupertinoPicker(
        key: _refreshCupertinoPickers ? UniqueKey() : null,
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: 8.5.percentOfWidth(context),
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
            child: Text(element.toString(), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.0.responsiveFont(context))),
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
