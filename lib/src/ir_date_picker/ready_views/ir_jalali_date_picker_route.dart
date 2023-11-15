import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:ir_datetime_picker/src/ir_date_picker/core/ir_jalali_date_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';

// --------------------------------------------------------------------------------------------------------------------

/// [IRJalaliDatePickerResponsiveRoute] is a ready responsive route widget that used with [showIRJalaliDatePickerRoute] top function.

class IRJalaliDatePickerResponsiveRoute extends StatelessWidget {
  final Jalali? initialDate;
  final int? minYear;
  final int? maxYear;
  final String title;
  final bool visibleTodayButton;
  final String todayButtonText;
  final String confirmButtonText;

  const IRJalaliDatePickerResponsiveRoute({
    super.key,
    this.initialDate,
    this.minYear,
    this.maxYear,
    required this.title,
    this.visibleTodayButton = true,
    required this.todayButtonText,
    required this.confirmButtonText,
  });

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
    Widget titleText = Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 22.0.responsiveFont(context), fontWeight: FontWeight.w700),
    );
    Widget datePicker = IRJalaliDatePicker(
      initialDate: initialDate,
      minYear: minYear,
      maxYear: maxYear,
      visibleTodayButton: visibleTodayButton,
      todayButtonText: todayButtonText,
      onSelected: (Jalali jalaliDate) {
        selectedDate = jalaliDate;
      },
    );
    Widget confirmButton = ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: 50.0.percentOfWidth(context),
          height: 6.0.percentOfHeight(context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: themeData.primaryColor,
          elevation: 6.0,
          shadowColor: Colors.black38,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        ),
        child: Text(
          confirmButtonText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontSize: 14.0.responsiveFont(context),
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
        onPressed: () => Navigator.pop<Jalali?>(context, selectedDate),
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 100.percentOfWidth(context)),
            child: Column(
              children: [
                const SizedBox(width: double.infinity),
                Align(
                  alignment: Alignment.topRight,
                  child: backButton,
                ),
                SizedBox(height: 2.0.percentOfHeight(context)),
                titleText,
                SizedBox(height: 10.0.percentOfHeight(context)),
                datePicker,
                const Spacer(),
                confirmButton,
                SizedBox(height: 6.0.percentOfHeight(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------

/// [showIRJalaliDatePickerRoute] show a dialog with [IRJalaliDatePickerResponsiveRoute] widget.

Future<Jalali?> showIRJalaliDatePickerRoute(
    {required BuildContext context,
    Jalali? initialDate,
    int? minYear,
    int? maxYear,
    required String title,
    bool visibleTodayButton = true,
    required String todayButtonText,
    required String confirmButtonText}) async {
  Jalali? jalaliDate = await Navigator.of(context).push<Jalali?>(
    MaterialPageRoute(
      builder: (BuildContext buildContext) => IRJalaliDatePickerResponsiveRoute(
        initialDate: initialDate,
        minYear: minYear,
        maxYear: maxYear,
        title: title,
        visibleTodayButton: visibleTodayButton,
        todayButtonText: todayButtonText,
        confirmButtonText: confirmButtonText,
      ),
    ),
  );
  return jalaliDate;
}

// --------------------------------------------------------------------------------------------------------------------
