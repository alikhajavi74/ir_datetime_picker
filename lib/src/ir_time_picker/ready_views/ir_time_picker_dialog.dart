import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:ir_datetime_picker/src/helpers/time.dart';
import 'package:ir_datetime_picker/src/ir_time_picker/core/ir_time_picker.dart';

// --------------------------------------------------------------------------------------------------------------------

/// [IRTimePickerResponsiveDialog] is a ready responsive dialog widget that used with [showIRTimePickerDialog] top function.

class IRTimePickerResponsiveDialog extends StatelessWidget {
  final String title;
  final String nowButtonText;
  final String confirmButtonText;

  const IRTimePickerResponsiveDialog({
    super.key,
    required this.title,
    required this.nowButtonText,
    required this.confirmButtonText,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    DateTime now = DateTime.now();
    IRTimeModel selectedTime = IRTimeModel(hour: now.hour, minute: now.minute);
    Widget backButton = IconButton(
      iconSize: 7.0.percentOfWidth(context),
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context, null);
      },
    );
    Widget titleText = Text(
      title,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 22.0.responsiveFont(context), fontWeight: FontWeight.w700),
    );
    Widget timePicker = IRTimePicker(
      nowButtonText: nowButtonText,
      onSelected: (IRTimeModel time) {
        selectedTime = time;
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
          confirmButtonText,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14.0.responsiveFont(context), fontWeight: FontWeight.w600, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context, selectedTime);
        },
      ),
    );
    return ConstrainedBox(
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
              titleText,
              SizedBox(height: 1.5.percentOfHeight(context)),
              timePicker,
              const Spacer(),
              submitButton,
              SizedBox(height: 4.0.percentOfHeight(context)),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------

/// [showIRTimePickerDialog] show a dialog with [IRTimePickerResponsiveDialog] widget.

Future<IRTimeModel?> showIRTimePickerDialog({required BuildContext context, String? title, String? nowButtonText, String? confirmButtonText}) async {
  IRTimeModel? time = await showDialog<IRTimeModel?>(
    context: context,
    builder: (BuildContext buildContext) => Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: Center(
        child: IRTimePickerResponsiveDialog(
          title: title ?? "انتخاب زمان",
          nowButtonText: nowButtonText ?? "انتخاب اکنون",
          confirmButtonText: confirmButtonText ?? "تایید",
        ),
      ),
    ),
  );
  return time;
}

// --------------------------------------------------------------------------------------------------------------------
