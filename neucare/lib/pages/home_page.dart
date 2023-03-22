import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';
import 'package:neucare/pages/top_bar.dart';
import 'package:neucare/pages/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:neucare/pages/app_bar.dart';
import 'package:neucare/pages/custom_container.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return customContainer(
      Scaffold(
          backgroundColor: Colors.transparent,
          appBar:
              customAppBar(0, Colors.lightBlue[50], Colors.black, "Neucare"),
          drawer: AppDrawer(),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      TopBar(
                          imagePath: 'lib/images/token.png',
                          userName: user?.displayName)
                    ]),
              ],
            ),
          )),
    );
  }
}
