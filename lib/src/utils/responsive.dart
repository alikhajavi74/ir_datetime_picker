import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------

// Responsive top level functions:

/// get percent of width
/// Eg: getPercentOfWidth(context, 60.0) getting 60% of user device width.
double getPercentOfWidth(BuildContext context, double percent) {
  return percent * (MediaQuery.of(context).size.width / 100.0);
}

/// get percent of height
/// Eg: getPercentOfHeight(context, 60.0) getting 60% of user device height.
double getPercentOfHeight(BuildContext context, double percent) {
  return percent * (MediaQuery.of(context).size.height / 100.0);
}

/// get responsive font according to user device sizes.
double getResponsiveFontSize(BuildContext context, double fontSize) {
  return (fontSize / 720.0) * MediaQuery.of(context).size.height;
}

// --------------------------------------------------------------------------------------------------------------------

// Responsive extention:

extension MResponsive on num {
  /// The same as [getPercentOfHeight]
  double h(BuildContext context) {
    return this * (MediaQuery.of(context).size.height / 100.0);
  }

  /// The same as [getPercentOfWidth]
  double w(BuildContext context) {
    return this * (MediaQuery.of(context).size.width / 100.0);
  }

  /// The same as [getResponsiveFontSize]
  double rf(BuildContext context) {
    return (this / 720.0) * MediaQuery.of(context).size.height;
  }
}

// --------------------------------------------------------------------------------------------------------------------
