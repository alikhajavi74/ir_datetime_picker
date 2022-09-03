import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ir_datetime_picker/src/utils/responsive.dart';

Widget generateCupertinoPicker(
        {required BuildContext context,
        required List list,
        required int initialItem,
        required ValueChanged<int> onSelectedItemChanged}) =>
    SizedBox(
      width: getPercentOfWidth(context, 30.0),
      height: getPercentOfHeight(context, 30.0),
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: getPercentOfWidth(context, 8.5),
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
            child: Text(element.toString(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: getResponsiveFontSize(context, 18.0))),
          );
        }).toList(),
      ),
    );
