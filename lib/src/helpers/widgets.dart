import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------

/// my custom [InkWell] widget:

typedef MFutureCallbackWithContext = Future Function(BuildContext context);

class MInkWell extends StatelessWidget {
  final Color splashColor;
  final double borderRadius;
  final Widget child;
  final MFutureCallbackWithContext onTap;

  const MInkWell({Key? key, this.splashColor = Colors.grey, this.borderRadius = 0.0, required this.child, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              splashColor: splashColor.withAlpha(50),
              highlightColor: splashColor.withAlpha(50),
              borderRadius: BorderRadius.circular(borderRadius),
              onTap: () => onTap(context),
            ),
          ),
        ),
      ],
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------
