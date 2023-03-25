import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';

Function(String, Widget, User?) baseWidget =
    (String title, Widget body, User? user) {
  return customContainer(
    Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => ListTile(
                    title: Column(children: [
                      Container(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: customAppBar(
                            Colors.lightBlue[50], Colors.black, user),
                      ),
                      body,
                    ]),
                  ),
                  childCount: 1,
                ),
              )
            ],
          ),
        )),
  );
};
