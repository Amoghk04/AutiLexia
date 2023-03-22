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
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFE1F5FE), Color(0xFF81D4FA), Color(0xFF43A047)]
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue[50],
          foregroundColor: Colors.black,
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
        )),
    );
  }
}
