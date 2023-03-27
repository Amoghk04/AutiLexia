import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/top_bar.dart';

Function(Color?, Color?, User?) customAppBar =
    (Color? backgroundColor, Color? foregroundColor, User? user) {
  return AppBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      elevation: double.infinity,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      title: TopBar(imagePath: "lib/images/token.png", user: user));
};
