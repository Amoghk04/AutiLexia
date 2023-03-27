import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';

Widget baseWidget(BuildContext context, String title, String backgroundImgPath,
    Widget body, User? user) {
  return customContainer(
    Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: customAppBar(Colors.lightBlue[50], Colors.black, user),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 3,
                    bottom: MediaQuery.of(context).size.width / 6),
                child: body,
              ),
            ]))),
    backgroundImgPath: backgroundImgPath,
  );
}
