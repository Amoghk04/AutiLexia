import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';
import 'package:neucare/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';
import 'package:neucare/storylines/first_storyline.dart';
import 'package:neucare/storylines/second_storyline.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  Function(User?) getStoryLineFromIndex(int index) {
    if (index == 0) {
      return (user) => FirstStoryLine(user: user);
    } else if (index == 1) {
      return (user) => SecondStoryLine(user: user);
    } else {
      return (user) => SecondStoryLine(user: user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return customContainer(
      Scaffold(
          backgroundColor: Colors.transparent,
          drawer: AppDrawer(),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child:
                      customAppBar(Colors.lightBlue[50], Colors.black, user)),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FirstStoryLine(user: user)));
                    },
                    child: const CircleAvatar(radius: 15)),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondStoryLine(user: user)));
                    },
                    child: const CircleAvatar(radius: 15)),
              ]),
            ]),
          )),
    );
  }
}
