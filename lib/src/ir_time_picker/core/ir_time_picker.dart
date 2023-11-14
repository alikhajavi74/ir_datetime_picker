import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/print.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';
import 'package:ir_datetime_picker/src/helpers/time.dart';

/// [IRTimePickerOnSelected] is a callback function that will call when user change cupertino pickers.

typedef IRTimePickerOnSelected = void Function(IRTimeModel time);

/// You can use [IRTimePicker] to design your own widgets.

class IRTimePicker extends StatefulWidget {
  final bool visibleNowButton;
  final String nowButtonText;
  final BoxConstraints? constraints;
  final IRTimePickerOnSelected onSelected;
  final TextStyle? textStyle;
  final double diameterRatio;
  final double magnification;
  final double offAxisFraction;
  final double squeeze;

  const IRTimePicker({
    super.key,
    this.visibleNowButton = true,
    required this.nowButtonText,
    this.constraints,
    required this.onSelected,
    this.textStyle,
    this.diameterRatio = 1.0,
    this.magnification = 1.5,
    this.offAxisFraction = 0.0,
    this.squeeze = 1.3,
  });

  @override
  State<IRTimePicker> createState() => _IRTimePickerState();
}

class _IRTimePickerState extends State<IRTimePicker> {
  late bool _refreshCupertinoPickers;
  late List<String> _minutes;
  late List<String> _hours;
  late int _selectedMinute;
  late int _selectedHour;

  @override
  void initState() {
    super.initState();
    _refreshCupertinoPickers = false;
    _selectedMinute = DateTime.now().minute;
    _selectedHour = DateTime.now().hour;
    _minutes = List.generate(
      60,
      (index) => index.toString().padLeft(2, "0"),
    );
    _hours = List.generate(
      24,
      (index) => index.toString().padLeft(2, "0"),
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshCupertinoPickers = false;
    });
    BoxConstraints cupertinoPickersConstraints = BoxConstraints.loose(
      Size(100.0.percentOfWidth(context), 30.0.percentOfHeight(context)),
    );
    Widget cupertinoPickers = Directionality(
      textDirection: TextDirection.ltr,
      child: ConstrainedBox(
        constraints: widget.constraints ?? cupertinoPickersConstraints,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _cupertinoPicker(
              context: context,
              list: _hours,
              initialItem: _hours.indexOf(_selectedHour.toString().padLeft(2, "0")),
              onSelectedItemChanged: (selectedIndex) {
                _selectedHour = int.parse(_hours[selectedIndex]);
                widget.onSelected(_getSelectedIRtime());
              },
            ),
            Text(" : ", style: widget.textStyle ?? Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.0.responsiveFont(context))),
            _cupertinoPicker(
              context: context,
              list: _minutes,
              initialItem: _minutes.indexOf(_selectedMinute.toString().padLeft(2, "0")),
              onSelectedItemChanged: (selectedIndex) {
                _selectedMinute = int.parse(_minutes[selectedIndex]);
                widget.onSelected(_getSelectedIRtime());
              },
            ),
          ],
        ),
      ),
    );
    Widget nowButton = Column(
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
                icon: Icon(Icons.info, size: 6.5.percentOfWidth(context), color: widget.textStyle?.color ?? Theme.of(context).textTheme.titleMedium?.color),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(2.0.percentOfWidth(context)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                label: Text(widget.nowButtonText, style: (widget.textStyle ?? Theme.of(context).textTheme.titleMedium)?.copyWith(fontSize: 14.responsiveFont(context), fontWeight: FontWeight.w600)),
                onPressed: () {
                  setState(() {
                    _refreshCupertinoPickers = true;
                    _selectedMinute = DateTime.now().minute;
                    _selectedHour = DateTime.now().hour;
                  });
                  widget.onSelected(_getSelectedIRtime());
                },
              ),
            ],
          ),
        ),
      ],
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        cupertinoPickers,
        Visibility(
          visible: widget.visibleNowButton,
          child: nowButton,
        ),
      ],
    );
  }

  Widget _cupertinoPicker({required BuildContext context, required List list, required int initialItem, required ValueChanged<int> onSelectedItemChanged}) {
    mPrint(initialItem);
    BoxConstraints cupertinoPickerConstraints = BoxConstraints.loose(
      Size(30.0.percentOfWidth(context), double.infinity),
    );
    return ConstrainedBox(
      constraints: cupertinoPickerConstraints,
      child: CupertinoPicker(
        key: _refreshCupertinoPickers ? UniqueKey() : null,
        backgroundColor: Colors.transparent,
        looping: true,
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: 8.5.percentOfWidth(context),
        diameterRatio: widget.diameterRatio,
        magnification: widget.magnification,
        offAxisFraction: widget.offAxisFraction,
        squeeze: widget.squeeze,
        selectionOverlay: Container(),
        onSelectedItemChanged: onSelectedItemChanged,
        children: list.map<Widget>(
          (element) {
            return Center(
              child: Text(
                element.toString(),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: widget.textStyle?.color,
                      fontSize: widget.textStyle?.fontSize ?? 18.0.responsiveFont(context),
                      fontWeight: widget.textStyle?.fontWeight,
                    ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  IRTimeModel _getSelectedIRtime() {
    return IRTimeModel(hour: _selectedHour, minute: _selectedMinute);
  }
}
