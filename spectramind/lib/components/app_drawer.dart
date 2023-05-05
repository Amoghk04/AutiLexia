import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:spectramind/auth.dart';
import 'package:spectramind/pages/mental_disorders.dart';
import 'package:spectramind/pages/profile_page.dart';
import 'package:spectramind/pages/help_page.dart';

class AppDrawer extends StatelessWidget {
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }

  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiLevelDrawer(
        divisionColor: Colors.accents[5],
        backgroundColor: Colors.lightBlue[50],
        header: Column(children: [
          Image.asset(
            "lib/images/logo.png",
            alignment: Alignment.center,
          ),
          Text("Spectramind", style: Theme.of(context).textTheme.titleLarge)
        ]),
        children: [
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/profile_placeholder.png"),
                    const Text("Profile"),
                  ]),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfilePage(user: user)));
              }),
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/help.png"),
                    const Text("Help"),
                  ]),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpPage(user: user)));
              }),
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/logo.png"),
                    const Text("Mental Disorders"),
                  ]),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MentalDisorders(user: user)));
              }),
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/sign_out.png"),
                    const Text("Sign Out"),
                  ]),
              onClick: signOut),
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(""),
                  ]),
              onClick: () {}),
        ]);
  }
}
