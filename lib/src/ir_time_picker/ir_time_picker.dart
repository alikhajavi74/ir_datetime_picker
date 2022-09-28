import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/print.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';

import 'ir_time_model.dart';

typedef IRTimePickerOnSelected = void Function(IRTimeModel time);

class IRTimePicker extends StatefulWidget {
  final IRTimePickerOnSelected onSelected;

  const IRTimePicker({Key? key, required this.onSelected}) : super(key: key);

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
    Widget cupertinoPickers = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        generateCupertinoPicker(
          context: context,
          list: _minutes,
          initialItem: _minutes.indexOf(_selectedMinute.toString().padLeft(2, "0")),
          onSelectedItemChanged: (selectedIndex) {
            _selectedMinute = int.parse(_minutes[selectedIndex]);
            widget.onSelected(getSelectedIRtime());
          },
        ),
        Text(" : ", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.0.responsiveFont(context))),
        generateCupertinoPicker(
          context: context,
          list: _hours,
          initialItem: _hours.indexOf(_selectedHour.toString().padLeft(2, "0")),
          onSelectedItemChanged: (selectedIndex) {
            _selectedHour = int.parse(_hours[selectedIndex]);
            widget.onSelected(getSelectedIRtime());
          },
        ),
      ],
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
                icon: const Icon(Icons.info),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(2.0.percentOfWidth(context)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                ),
                label: Text("انتخاب اکنون", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor, fontSize: 14.0.responsiveFont(context))),
                onPressed: () {
                  setState(() {
                    _refreshCupertinoPickers = true;
                    _selectedMinute = DateTime.now().minute;
                    _selectedHour = DateTime.now().hour;
                  });
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
        nowButton,
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
        looping: true,
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: 8.5.percentOfWidth(context),
        diameterRatio: 1.0,
        onSelectedItemChanged: onSelectedItemChanged,
        children: list.map<Widget>((element) {
          return Center(
            child: Text(element.toString(), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.0.responsiveFont(context))),
          );
        }).toList(),
      ),
    );
  }

  IRTimeModel getSelectedIRtime() {
    return IRTimeModel(hour: _selectedHour, minute: _selectedMinute);
  }
}
