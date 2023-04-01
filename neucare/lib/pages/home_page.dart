import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';
import 'package:neucare/components/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';
import 'package:neucare/storylines/daily_challenge.dart';
import 'package:neucare/storylines/first_storyline.dart';
import 'package:neucare/storylines/second_storyline.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final User? user = Auth().currentUser;

  @override
  Widget build(BuildContext context) {
    return customContainer(
      backgroundImgPath: "",
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
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 3,
                      bottom: MediaQuery.of(context).size.width / 6),
                  child: Column(children: [
                    const Text("Welcome!",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.black87,
                          fontFamily: 'LuckiestGuy',
                        )),
                    const SizedBox(height: 30),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
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
                                Text("Henry: The Autistic Parrot",
                                    style: TextStyle(
                                      fontFamily: 'AmaticSC',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    )),
                              ])),
                          GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
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
                                Text("Second story title",
                                    style: TextStyle(
                                      fontFamily: 'AmaticSC',
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                    )),
                              ])),
                        ]),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DailyChallenge(user: user)));
                            },
                            child: Column(children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("lib/images/story.png"),
                                radius: 50,
                              ),
                              SizedBox(height: 10),
                              Text("Daily Challenge(Coming Soon!!!)",
                                  style: TextStyle(
                                    fontFamily: 'AmaticSC',
                                    fontWeight: FontWeight.w900,
                                    fontSize: 20,
                                  )),
                            ])),
                      ],
                    )
                  ])),
              Container(
                  height: MediaQuery.of(context).size.height / 6,
                  width: MediaQuery.of(context).size.width - 20,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  child: Column(children: const [
                    Text("Reminder",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    Divider(),
                    SizedBox(height: 40),
                    Text("You have 2 modules left for the day!!",
                        style: TextStyle(color: Colors.black45, fontSize: 20)),
                  ]))
            ]),
          )),
    );
  }
}
