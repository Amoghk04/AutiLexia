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
      // Write the profile page styling in the body of this Scaffold.
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Image.asset("lib/images/profile_placeholder.png"),
              ),
              const SizedBox(height: 20),
              Text('${user?.email}',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 80),
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("lib/images/pet.png")),
              ),
              const SizedBox(height: 20),
              Text('Pet Name',
                  style: Theme.of(context).textTheme.headlineSmall),
              const Divider(),
            ],
          ),
        ),
      ),
    ));
  }
}
