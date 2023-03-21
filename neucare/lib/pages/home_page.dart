import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';
import 'package:neucare/pages/top_bar.dart';
import 'package:neucare/pages/app_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Widget _title() {
    return const Text('Neucare');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.accents[15],
          foregroundColor: Colors.white,
          title: _title(),
        ),
        drawer: AppDrawer(),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                TopBar(
                    imagePath: 'lib/images/token.png',
                    userName: user?.displayName)
              ]),
            ],
          ),
        ));
  }
}
