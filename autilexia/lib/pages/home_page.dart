import 'package:flutter/material.dart';
import 'package:spectramind/components/app_drawer.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';
import 'package:spectramind/storylines/daily_challenge.dart';
import 'package:spectramind/storylines/first_storyline.dart';
import 'package:spectramind/storylines/second_storyline.dart';
import 'package:spectramind/pages/shop_page.dart';
import 'package:spectramind/mongodb_auth.dart';

class HomePage extends StatelessWidget {
  final String username; // Require username as a parameter

  HomePage({Key? key, required this.username}) : super(key: key);

  final MongoDBAuth mongoAuth = MongoDBAuth();

  Future<void> _checkUserModules(BuildContext context) async {
    try {
      // Example usage of MongoDBAuth if you want to fetch user-specific data
      final userData = await mongoAuth.getUserData(username);
      print("User Data: $userData"); // Handle user data as needed
    } catch (e) {
      print("Error fetching user modules: $e");
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
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: customAppBar(Colors.lightBlue[50], Colors.black, null),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 12,
                  bottom: MediaQuery.of(context).size.width / 6,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Welcome, $username!",
                          style: const TextStyle(
                            fontSize: 35,
                            color: Colors.black87,
                            fontFamily: 'LuckiestGuy',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ShopPage(
                                  currentUser: username,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("lib/images/shop.jpeg"),
                                radius: 15,
                                foregroundColor: Colors.transparent,
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Shop",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    FirstStoryLine(username: username),
                              ),
                            );
                          },
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("lib/images/story.png"),
                                radius: 50,
                                foregroundColor: Colors.transparent,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Henry: The Autistic",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Parrot",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    SecondStoryLine(username: username),
                              ),
                            );
                          },
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("lib/images/story.png"),
                                radius: 50,
                                foregroundColor: Colors.transparent,
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Claudio: The Dyslexic",
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "Turtle",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    const Text(
                      "Reminder",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    const SizedBox(height: 40),
                    FutureBuilder(
                      future: _checkUserModules(context),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading...");
                        } else if (snapshot.hasError) {
                          return const Text(
                            "Error fetching modules",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 20,
                            ),
                          );
                        } else {
                          return Text(
                            "Modules fetched successfully!",
                            style: const TextStyle(
                              color: Colors.black45,
                              fontSize: 20,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
