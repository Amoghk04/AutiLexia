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
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child:
                      customAppBar(Colors.lightBlue[50], Colors.black, user)),
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width / 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Welcome!",
                            style: Theme.of(context).textTheme.titleLarge),
                        const SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FirstStoryLine(user: user)));
                                  },
                                  child: Column(children: const [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("lib/images/story.png"),
                                      radius: 50,
                                      foregroundColor: Colors.transparent,
                                    ),
                                    SizedBox(height: 10),
                                    Text("First story title."),
                                  ])),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SecondStoryLine(user: user)));
                                  },
                                  child: Column(children: const [
                                    CircleAvatar(
                                      backgroundImage:
                                          AssetImage("lib/images/story.png"),
                                      radius: 50,
                                      foregroundColor: Colors.transparent,
                                    ),
                                    SizedBox(height: 10),
                                    Text("Second story title."),
                                  ])),
                            ]),
                      ])),
              const SizedBox(height: 380),
              Container(
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(children: const [
                    Text("Reminder",
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 35,
                            fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("You have 2 modules left for the day!!",
                        style: TextStyle(color: Colors.black87, fontSize: 20)),
                  ]))
            ]),
          )),
    );
  }
}
