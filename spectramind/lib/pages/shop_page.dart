import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';

class ShopPage extends StatelessWidget {
  final User? user;
  const ShopPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: customAppBar(Colors.lightBlue[50], Colors.black, user),
            ),
          )),
    );
  }
}
