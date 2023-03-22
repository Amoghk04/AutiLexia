import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/pages/app_bar.dart';
import 'package:neucare/pages/custom_container.dart';

class ProfilePage extends StatelessWidget {
  final User? user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return customContainer(Scaffold(
      backgroundColor: Colors.transparent,
      appBar: customAppBar(0, Colors.lightBlue[50], Colors.black, "Profile"),
      // TODO: Write the profile page styling in the body of this Scaffold.
      body: const SizedBox(height: 20),
    ));
  }
}
