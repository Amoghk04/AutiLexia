import 'package:flutter/material.dart';

Widget customContainer(Widget child, {required String backgroundImgPath}) {
  return (backgroundImgPath == "")
      ? Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFE1F5FE),
                  Color(0xFF81D4FA),
                  Color(0xFF43A047)
                ]),
          ),
          child: child,
        )
      : Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(backgroundImgPath)),
          ),
          child: child);
}
