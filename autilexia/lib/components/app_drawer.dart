import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:spectramind/mongodb_auth.dart';
import 'package:spectramind/pages/mental_disorders.dart';
import 'package:spectramind/pages/profile_page.dart';
import 'package:spectramind/pages/help_page.dart';
import 'package:spectramind/pages/speech_practice.dart';

class AppDrawer extends StatelessWidget {
  final String? currentUser = MongoDBAuth.username; // Get the current user from MongoDBAuth

  Future<void> signOut() async {
    await MongoDBAuth().signOut(); // Sign out from MongoDBAuth
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
          // Profile Page
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/profile_placeholder.png"),
                    const Text("Profile"),
                  ]),
              onClick: () {
                if (currentUser != null) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProfilePage(currentUser: currentUser!)));
                } else {
                  // If no user is logged in, show a login screen or message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please login first')),
                  );
                }
              }),
          // Help Page
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/help.png"),
                    const Text("Help"),
                  ]),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HelpPage(currentUser: currentUser)));
              }),
          // Mental Disorders Page
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/logo.png"),
                    const Text("Mental Disorders"),
                  ]),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MentalDisorders(currentUser: currentUser)));
              }),
          // Speech Practice Page
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/tts.png"),
                    const Text("Speech Practice"),
                  ]),
              onClick: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SpeechPractice(currentUser: currentUser)));
              }),
          // Sign Out
          MLMenuItem(
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset("lib/images/sign_out.png"),
                    const Text("Sign Out"),
                  ]),
              onClick: signOut),
          // Empty Menu Item (used for spacing)
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
