import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/storylines/first_storyline.dart';
import 'package:neucare/storylines/second_storyline.dart';

class GameMap extends StatelessWidget {
  final User? user;
  const GameMap({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        primary: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FirstStoryLine(user: user)));
                },
                child: CircleAvatar(
                  radius: 15,
                  foregroundColor: Colors.accents[13],
                )),
            const SizedBox(height: 10),
            GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SecondStoryLine(user: user)));
                },
                child: CircleAvatar(
                  radius: 15,
                  foregroundColor: Colors.accents[13],
                )),
          ],
        ));
  }
}
