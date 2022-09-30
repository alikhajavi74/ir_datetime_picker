import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:shamsi_date/shamsi_date.dart';

import 'ir_date_picker.dart';

// --------------------------------------------------------------------------------------------------------------------

/// [IRDatePickerResponsiveDialog] is a ready responsive dialog widget that used with [showIRDatePickerDialog] top function.

class IRDatePickerResponsiveDialog extends StatelessWidget {
  final Jalali? initialDate;
  final int? startYear;
  final int? endYear;
  final bool? enableTodayButton;
  final String? todayButtonText;

  const IRDatePickerResponsiveDialog({
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
      iconSize: 7.0.percentOfWidth(context),
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
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: 90.0.percentOfWidth(context),
          height: 65.0.percentOfHeight(context),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white,
          elevation: 6.0,
          shadowColor: Colors.black38,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: double.infinity),
                Align(
                  alignment: Alignment.topRight,
                  child: backButton,
                ),
                SizedBox(height: 1.5.percentOfHeight(context)),
                title,
                SizedBox(height: 1.5.percentOfHeight(context)),
                datePicker,
                const Spacer(),
                submitButton,
                SizedBox(height: 2.0.percentOfHeight(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------

/// [showIRDatePickerDialog] show a dialog with [IRDatePickerResponsiveDialog] widget.

Future<Jalali?> showIRDatePickerDialog(BuildContext context, {Jalali? initialDate, int? startYear, int? endYear, bool? enableTodayButton, String? todayButtonText}) async {
  Jalali? jalaliDate = await showDialog<Jalali?>(
    context: context,
    builder: (BuildContext buildContext) => Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: Center(
        child: IRDatePickerResponsiveDialog(
          initialDate: initialDate,
          startYear: startYear,
          endYear: endYear,
          enableTodayButton: enableTodayButton,
          todayButtonText: todayButtonText,
        ),
      ),
    ),
  );
  return jalaliDate;
}

// --------------------------------------------------------------------------------------------------------------------
