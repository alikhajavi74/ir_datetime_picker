import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'ir_date_picker.dart';

// --------------------------------------------------------------------------------------------------------------------

// IRDatePickerResponsiveRoute:

class IRDatePickerResponsiveRoute extends StatelessWidget {
  final Jalali? initialDate;
  final int? startYear;
  final int? endYear;
  final bool? enableTodayButton;
  final String? todayButtonText;

  const IRDatePickerResponsiveRoute({
    Key? key,
    this.initialDate,
    this.startYear,
    this.endYear,
    this.enableTodayButton,
    this.todayButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    Jalali selectedDate = initialDate ?? Jalali.now();
    Widget backButton = IconButton(
      iconSize: 7.5.percentOfWidth(context),
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.pop<Jalali?>(context, null);
      },
    );
    Widget title = Text(
      "انتخاب تاریخ",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: 20.0.responsiveFont(context),
            fontWeight: FontWeight.w700,
          ),
    );
    Widget datePicker = IRDatePicker(
      initialDate: initialDate,
      startYear: startYear,
      endYear: endYear,
      enableTodayButton: enableTodayButton,
      todayButtonText: todayButtonText,
      onSelected: (Jalali jalaliDate) {
        selectedDate = jalaliDate;
      },
    );
    Widget submitButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: 50.0.percentOfWidth(context), height: 6.0.percentOfHeight(context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeData.primaryColor,
          elevation: 6.0,
          shadowColor: Colors.black38,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(
          "تایید",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14.0.responsiveFont(context), fontWeight: FontWeight.w600, color: Colors.white),
        ),
        onPressed: () => Navigator.pop<Jalali?>(context, selectedDate),
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
              SizedBox(height: 2.0.percentOfHeight(context)),
              title,
              SizedBox(height: 10.0.percentOfHeight(context)),
              datePicker,
              const Spacer(),
              submitButton,
              SizedBox(height: 6.0.percentOfHeight(context)),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------

// showIRDatePickerRoute top function:

Future<Jalali?> showIRDatePickerRoute(BuildContext context, {Jalali? initialDate, int? startYear, int? endYear, bool? enableTodayButton, String? todayButtonText}) async {
  Jalali? jalaliDate = await Navigator.of(context).push<Jalali?>(
    MaterialPageRoute(
      builder: (BuildContext buildContext) => IRDatePickerResponsiveRoute(
        initialDate: initialDate,
        startYear: startYear,
        endYear: endYear,
        enableTodayButton: enableTodayButton,
        todayButtonText: todayButtonText,
      ),
    ),
  );
  return jalaliDate;
}

// --------------------------------------------------------------------------------------------------------------------
