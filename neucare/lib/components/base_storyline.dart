import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';
import 'package:neucare/components/top_bar.dart';

Function(String, Widget, User?) baseWidget =
    (String title, Widget body, User? user) {
  return customContainer(
    Scaffold(
        backgroundColor: Colors.transparent,
        appBar: customAppBar(0, Colors.lightBlue[50], Colors.black, title),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Column(children: <Widget>[
                TopBar(imagePath: 'lib/images/token.png', user: user),
                body,
              ]),
            ],
          ),
        )),
  );
};
