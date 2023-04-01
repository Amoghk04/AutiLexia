import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';
import 'package:neucare/components/pet_slider.dart';

final List<String> imgList = [
  'lib/images/Unicorndalle.png',
  'lib/images/Pheonix.png',
  'lib/images/Kitsune.png',
];

class ProfilePage extends StatelessWidget {
  final User? user;
  const ProfilePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return customContainer(
        backgroundImgPath: "",
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child:
                        customAppBar(Colors.lightBlue[50], Colors.black, user),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "User Profile",
                    style: TextStyle(
                      fontFamily: 'LuckiestGuy',
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset("lib/images/profile_placeholder.png"),
                  ),
                  const SizedBox(height: 20),
                  Text('${user?.email}',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 40),
                  const Divider(color: Colors.transparent),
                  CarouselWithDots(imgList: imgList),
                  const SizedBox(height: 20),
                  const Text(
                    'Our different Pets',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'LuckiestGuy',
                    ),
                  ),
                  const Divider(color: Colors.transparent),
                ],
              ),
            ),
          ),
        ));
  }
}
