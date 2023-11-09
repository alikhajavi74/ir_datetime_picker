import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------

// Responsive top level functions:

/// get percent of width
/// Eg: mGetPercentOfWidth(context, 60.0) getting 60% of user device width.
double mGetPercentOfWidth(BuildContext context, num percent) {
  double deviceWidth = MediaQuery.of(context).size.width;
  if (deviceWidth > 450) {
    deviceWidth = 450;
  }
  return percent * (deviceWidth / 100.0);
}

/// get percent of height
/// Eg: mGetPercentOfHeight(context, 60.0) getting 60% of user device height.
double mGetPercentOfHeight(BuildContext context, num percent) {
  double deviceHeight = MediaQuery.of(context).size.height;
  return percent * (deviceHeight / 100.0);
}

/// get responsive font according to user device sizes.
double mGetResponsiveFontSize(BuildContext context, num fontSize) {
  double deviceHeight = MediaQuery.of(context).size.height;
  return (fontSize / 720.0) * deviceHeight;
}

// --------------------------------------------------------------------------------------------------------------------

// Responsive extention:

extension MResponsive on num {
  /// The same as [mGetPercentOfHeight]
  double percentOfHeight(BuildContext context) {
    return mGetPercentOfHeight(context, this);
  }

  /// The same as [mGetPercentOfWidth]
  double percentOfWidth(BuildContext context) {
    return mGetPercentOfWidth(context, this);
  }

  /// The same as [mGetResponsiveFontSize]
  double responsiveFont(BuildContext context) {
    return mGetResponsiveFontSize(context, this);
  }
}

// --------------------------------------------------------------------------------------------------------------------
