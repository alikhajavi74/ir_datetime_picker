import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------

// Responsive top level functions:

/// get percent of width
/// Eg: mGetPercentOfWidth(context, 60.0) getting 60% of user device width.
double mGetPercentOfWidth(BuildContext context, double percent) {
  return percent * (MediaQuery.of(context).size.width / 100.0);
}

/// get percent of height
/// Eg: mGetPercentOfHeight(context, 60.0) getting 60% of user device height.
double mGetPercentOfHeight(BuildContext context, double percent) {
  return percent * (MediaQuery.of(context).size.height / 100.0);
}

/// get responsive font according to user device sizes.
double mGetResponsiveFontSize(BuildContext context, double fontSize) {
  return (fontSize / 720.0) * MediaQuery.of(context).size.height;
}

// --------------------------------------------------------------------------------------------------------------------

// Responsive extention:

extension MResponsive on num {
  /// The same as [mGetPercentOfHeight]
  double percentOfHeight(BuildContext context) {
    return this * (MediaQuery.of(context).size.height / 100.0);
  }

  /// The same as [mGetPercentOfWidth]
  double percentOfWidth(BuildContext context) {
    return this * (MediaQuery.of(context).size.width / 100.0);
  }

  /// The same as [mGetResponsiveFontSize]
  double responsiveFont(BuildContext context) {
    return (this / 720.0) * MediaQuery.of(context).size.height;
  }
}

// --------------------------------------------------------------------------------------------------------------------
