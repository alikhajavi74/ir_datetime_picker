import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/helpers/print.dart';
import 'package:ir_datetime_picker/src/helpers/responsive.dart';

class IRTimePicker extends StatefulWidget {
  final int initialTime;

  const IRTimePicker({
    Key? key,
    this.initialTime = 0,
  }) : super(key: key);

  @override
  State<IRTimePicker> createState() => _IRTimePickerState();
}

class _IRTimePickerState extends State<IRTimePicker> {
  late int _initialTime;

  @override
  void initState() {
    super.initState();
    _initialTime = widget.initialTime ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    DateTime.now();
    Widget cupertinoPickers = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        generateCupertinoPicker(
          context: context,
          list: List.generate(
            60,
            (index) {
              return index.toString().padLeft(2, "0");
            },
          ),
          initialItem: 0,
          onSelectedItemChanged: (selectedIndex) {},
        ),
        Text(" : ", style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 18.0.responsiveFont(context))),
        generateCupertinoPicker(
          context: context,
          list: List.generate(
            24,
            (index) {
              return index.toString().padLeft(2, "0");
            },
          ),
          initialItem: 0,
          onSelectedItemChanged: (selectedIndex) {},
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
                label: Text("انتخاب اکنون", style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).primaryColor, fontSize: 14.0.responsiveFont(context))),
                onPressed: () {
                  // TODO
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
        todayButton,
      ],
    );
  }

  Widget generateCupertinoPicker({required BuildContext context, required List list, required int initialItem, required ValueChanged<int> onSelectedItemChanged}) {
    mPrint(initialItem);
    return SizedBox(
      width: 30.0.percentOfWidth(context),
      height: 30.0.percentOfHeight(context),
      child: CupertinoPicker(
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
}
