import 'package:flutter/material.dart';
import 'package:spectramind/components/top_bar.dart';

Widget customAppBar(
    Color? backgroundColor, Color? foregroundColor, String? username) {
  return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: double.infinity,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      title: TopBar(imagePath: "lib/images/token.png", username: username ?? 'Guest'));  // Pass the 'username' string
}
