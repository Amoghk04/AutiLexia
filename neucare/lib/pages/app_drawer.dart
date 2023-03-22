import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';
import 'package:neucare/pages/profile_page.dart';

class AppDrawer extends StatelessWidget {
  final User? user = Auth().currentUser;
  Future<void> signOut() async {
    await Auth().signOut();
  }

  Widget _signOutButton() {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.accents[5])),
      onPressed: signOut,
      child: const Text(
        'Sign Out',
      ),
    );
  }

  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilePage(user: user)));
          },
        ),
        const Spacer(flex: 10),
        _signOutButton(),
      ],
    ));
  }
}
