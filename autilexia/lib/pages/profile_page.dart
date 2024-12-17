import 'package:flutter/material.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';
import 'package:spectramind/components/pet_slider.dart';

final List<String> imgList = [
  'lib/images/Unicorndalle.png',
  'lib/images/Pheonix.png',
  'lib/images/Kitsune.png',
];

class ProfilePage extends StatelessWidget {
  final String? currentUser;
  const ProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return customContainer(Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: customAppBar(Colors.lightBlue[50], Colors.black, currentUser),
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
              Text('${currentUser}',
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
