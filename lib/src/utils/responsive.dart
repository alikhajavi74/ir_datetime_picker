import 'package:flutter/material.dart';

// --------------------------------------------------------------------------------------------------------------------

// Responsive top level functions:

double getPercentOfWidth(BuildContext context, double percent) {
  return percent * (MediaQuery.of(context).size.width / 100);
}

double getPercentOfHeight(BuildContext context, double percent) {
  return percent * (MediaQuery.of(context).size.height / 100);
}

double getResponsiveFontSize(BuildContext context, double size) {
  return (size / 720) * MediaQuery.of(context).size.height;
}

// --------------------------------------------------------------------------------------------------------------------
