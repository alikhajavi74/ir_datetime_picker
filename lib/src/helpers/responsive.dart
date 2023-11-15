import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------

// Responsive top level functions:

/// * [mGetPercentOfWidth] get percent of width
/// ```dart
/// Eg getting 60% of user device width:
/// mGetPercentOfWidth(context, 60.0);
/// ```

double mGetPercentOfWidth(BuildContext context, num percent) {
  double deviceWidth = MediaQuery.of(context).size.width;
  if (deviceWidth > 450) {
    deviceWidth = 450;
  }
  return percent * (deviceWidth / 100.0);
}

/// * [mGetPercentOfHeight] get percent of height
/// ```dart
/// Eg getting 60% of user device height:
/// mGetPercentOfHeight(context, 60.0);
/// ```
double mGetPercentOfHeight(BuildContext context, num percent) {
  double deviceHeight = MediaQuery.of(context).size.height;
  return percent * (deviceHeight / 100.0);
}

/// * [mGetResponsiveFontSize] get responsive font according to user device sizes.
/// ```dart
/// Eg getting 15 sp font:
/// mGetResponsiveFontSize(context, 15);
/// ```
double mGetResponsiveFontSize(BuildContext context, num fontSize) {
  double deviceHeight = MediaQuery.of(context).size.height;
  return (fontSize / 720.0) * deviceHeight;
}

// --------------------------------------------------------------------------------------------------------------------

// Responsive extention:

extension MResponsive on num {
  /// * [percentOfHeight] same as [mGetPercentOfHeight]
  double percentOfHeight(BuildContext context) {
    return mGetPercentOfHeight(context, this);
  }

  /// * [percentOfWidth] same as [mGetPercentOfWidth]
  double percentOfWidth(BuildContext context) {
    return mGetPercentOfWidth(context, this);
  }

  /// * [responsiveFont] same as [mGetResponsiveFontSize]
  double responsiveFont(BuildContext context) {
    return mGetResponsiveFontSize(context, this);
  }
}

// --------------------------------------------------------------------------------------------------------------------
