import 'package:flutter/material.dart';

Function(double, Color?, Color?, String) customAppBar = (double elevation,
    Color? backgroundColor, Color? foregroundColor, String title) {
  return AppBar(
      elevation: elevation,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      title: Text(title));
};
