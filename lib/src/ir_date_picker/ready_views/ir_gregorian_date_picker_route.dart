import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:ir_datetime_picker/src/ir_date_picker/core/ir_gregorian_date_picker.dart';
import 'package:shamsi_date/shamsi_date.dart';

// --------------------------------------------------------------------------------------------------------------------

/// [IRGregorianDatePickerResponsiveRoute] is a ready responsive route widget that used with [showIRGregorianDatePickerRoute] top function.

class IRGregorianDatePickerResponsiveRoute extends StatelessWidget {
  final Gregorian? initialDate;
  final int? minYear;
  final int? maxYear;
  final String title;
  final bool visibleTodayButton;
  final String todayButtonText;
  final String confirmButtonText;

  const IRGregorianDatePickerResponsiveRoute({
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
    Gregorian selectedDate = initialDate ?? Gregorian.now();
    Widget backButton = IconButton(
      iconSize: 7.5.percentOfWidth(context),
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.pop<Gregorian?>(context, null);
      },
    );
    Widget titleText = Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontSize: 22.0.responsiveFont(context), fontWeight: FontWeight.w700),
    );
    Widget datePicker = IRGregorianDatePicker(
      initialDate: initialDate,
      minYear: minYear,
      maxYear: maxYear,
      visibleTodayButton: visibleTodayButton,
      todayButtonText: todayButtonText,
      onSelected: (Gregorian gregorianDate) {
        selectedDate = gregorianDate;
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
        onPressed: () => Navigator.pop<Gregorian?>(context, selectedDate),
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

/// [showIRGregorianDatePickerRoute] show a dialog with [IRGregorianDatePickerResponsiveRoute] widget.

Future<Gregorian?> showIRGregorianDatePickerRoute(
    {required BuildContext context,
    Gregorian? initialDate,
    int? minYear,
    int? maxYear,
    required String title,
    bool visibleTodayButton = true,
    required String todayButtonText,
    required String confirmButtonText}) async {
  Gregorian? gregorianDate = await Navigator.of(context).push<Gregorian?>(
    MaterialPageRoute(
      builder: (BuildContext buildContext) =>
          IRGregorianDatePickerResponsiveRoute(
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
  return gregorianDate;
}

// --------------------------------------------------------------------------------------------------------------------
