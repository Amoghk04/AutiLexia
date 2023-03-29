import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/components/app_bar.dart';
import 'package:neucare/components/custom_container.dart';
import 'package:neucare/components/pet_slider.dart';
import 'package:neucare/pages/profile_page.dart';

class HelpPage extends StatelessWidget {
  final User? user;
  const HelpPage({super.key, required this.user});

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

                const Text("Welcome to the help page",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                )),
                const SizedBox(height: 20),
                const Text("1. About Us -",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                const SizedBox(height: 15),
                const Text("<App_Name> is an interactive story mode game, which is played through the life of a "
                    "pet affected with a certain mental disorder, and the challenges face by it throughout its development years.",
                style: TextStyle(
                  fontSize: 16,
                )),
                const SizedBox(height: 15),
                const Text("2. Token System -",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                const SizedBox(height: 15),
                const Text("The tokens present in the game can be used to unlock different options, get new pets for yourself and also to unlock some storylines...\n\n"
                    "Ways to gain tokens are -\n\n"
                    "1. Upon finishing certain modules of the storylines you will be awarded with a certain amount of credits.\n\n"
                    "2. Answering the Daily Challenges also gives you some tokens.\n\n"
                    "3. Tokens can also be purchased upon completing the transaction certain amount of tokens will be credited to your account\n",
                style: TextStyle(
                  fontSize: 16,
                )),
                const Text("3. Reason for the story -",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                const SizedBox(height: 15),
                const Text("These stories were created due to the lack of awareness people have about mental disorders such as autism, dyslexia and others\n\n"
                    "From these stories, you can understand how the life of a person affected with these mental disorders perceives the world (albeit you play as a pet).\n\n",
                style: TextStyle(
                    fontSize: 16,
                )),
                const SizedBox(height: 15),
                const Text("4. Pets - ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
                CarouselWithDots(imgList: imgList),
                const SizedBox(height: 20),
                const Text("You can play the stories in the form of cute pets like these, which also enhances mood, as your mind produces dopamine on looking at them😍😍\n\n"
                    "You can purchase these pets from the tokens you have earned",
                style: TextStyle(
                  fontSize: 16,
                )),
                const SizedBox(height: 20),
                const Text('If you have any more doubts or want to give us any feedback you can get back to us at by sending a query at our official website\n\n'
                    'Ciao, Happy gaming for now!!!',
                style: TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                )),
              ],
            )
          ),
        )
      ),
    );
  }
}
