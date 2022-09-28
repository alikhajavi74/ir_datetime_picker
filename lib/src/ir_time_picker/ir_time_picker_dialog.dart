import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';

import 'ir_time_model.dart';
import 'ir_time_picker.dart';

// --------------------------------------------------------------------------------------------------------------------

// IRTimePickerResponsiveDialog:

class IRTimePickerResponsiveDialog extends StatelessWidget {
  const IRTimePickerResponsiveDialog({
    Key? key,
  }) : super(key: key);

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
    Widget title = Text(
      "انتخاب زمان",
      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20.0.responsiveFont(context), fontWeight: FontWeight.w700),
    );
    Widget timePicker = IRTimePicker(
      onSelected: (time) {
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
          "تایید",
          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 14.0.responsiveFont(context), fontWeight: FontWeight.w600, color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context, selectedTime);
        },
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
                timePicker,
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

// showIRTimePickerDialog top function:

Future<IRTimeModel?> showIRTimePickerDialog(BuildContext context) async {
  IRTimeModel? time = await showDialog<IRTimeModel?>(
    context: context,
    builder: (BuildContext buildContext) => Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.4),
      body: const Center(
        child: IRTimePickerResponsiveDialog(),
      ),
    ),
  );
  return time;
}

// --------------------------------------------------------------------------------------------------------------------
