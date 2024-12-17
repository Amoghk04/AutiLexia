import 'package:flutter/material.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';

Widget baseWidget(BuildContext context, String title, Widget body, String? currentUser) {
  return customContainer(
    Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: customAppBar(Colors.lightBlue[50], Colors.black, currentUser),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.width / 8,
                bottom: MediaQuery.of(context).size.width / 8),
            child: body,
          ),
        ]))),
  );
}
