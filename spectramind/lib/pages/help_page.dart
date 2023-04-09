import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';
import 'package:spectramind/components/pet_slider.dart';
import 'package:spectramind/pages/profile_page.dart';

class HelpPage extends StatelessWidget {
  final User? user;
  const HelpPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: customAppBar(
                          Colors.lightBlue[50], Colors.black, user),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(children: const [
                          Text("About Us -",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Divider(),
                          SizedBox(height: 15),
                          Text(
                              "<App_Name> is an interactive story mode game, which is played through the life of a "
                              "pet affected with a certain mental disorder, and the challenges face by it throughout its development years.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                              ))
                        ])),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(children: const [
                          Text("Token System -",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Divider(),
                          SizedBox(height: 15),
                          Text(
                              "The tokens present in the game can be used to unlock different options, get new pets for yourself and also to unlock some storylines...\n\n"
                              "Ways to gain tokens -\n\n"
                              "1. Upon finishing certain modules of the storylines you will be awarded with a certain amount of credits.\n\n"
                              "2. Answering the Daily Challenges also gives you some tokens.\n\n"
                              "3. Tokens can also be purchased upon completing the transaction certain amount of tokens will be credited to your account\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                              ))
                        ])),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(children: const [
                          Text("Reason for the story -",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          Divider(),
                          SizedBox(height: 15),
                          Text(
                              "These stories were created due to the lack of awareness people have about mental disorders such as autism, dyslexia and others\n\n"
                              "From these stories, you can understand how the life of a person affected with these mental disorders perceives the world (albeit you play as a pet).\n\n",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                              ))
                        ])),
                    const SizedBox(height: 15),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.lightBlue[50],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                        child: Column(children: [
                          const Text("Pets - ",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              )),
                          const Divider(),
                          CarouselWithDots(imgList: imgList),
                          const SizedBox(height: 20),
                          const Text(
                              "You can play the stories in the form of cute pets like these, which also enhances mood, as your mind produces dopamine on looking at them😍😍\n\n"
                              "You can purchase these pets from the tokens you have earned",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                              ))
                        ])),
                    const SizedBox(height: 20),
                    const Text(
                        'If you have any more doubts or want to give us any feedback you can get back to us at by sending a query at our official website',
                        style: TextStyle(
                          fontSize: 12,
                          fontStyle: FontStyle.italic,
                        )),
                  ],
                )),
          )),
    );
  }
}
