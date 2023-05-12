import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';

class ShopPage extends StatelessWidget {
  final User? user;
  const ShopPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return customContainer(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: customAppBar(Colors.lightBlue[50], Colors.black, user),
            ),
            const SizedBox(height: 10),
            const Text("\nWelcome to the Shop",
                style: TextStyle(
                  fontFamily: 'LuckiestGuy',
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                )),
            const SizedBox(height: 20),
            const Divider(color: Colors.black),
            const SizedBox(height: 20),
            Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("     Buy 100 tokens!!!",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Hind')),
                            SizedBox(height: 10),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("lib/images/token.png"),
                              radius: 35,
                              backgroundColor: Colors.transparent,
                            ),
                          ]),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                                "                           "
                                "USD 19.99\nBuy here",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w900,
                                ))
                          ]),
                    )
                  ],
                )),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
            const SizedBox(height: 10),
            Container(
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[50],
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text("     Get 10 Hints",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Hind')),
                            SizedBox(height: 10),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("lib/images/hint.jpeg"),
                              radius: 35,
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                            ),
                          ]),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                                "                                "
                                "🪙 20 tokens\nBuy here",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: 'Hind',
                                  fontWeight: FontWeight.w900,
                                ))
                          ]),
                    )
                  ],
                )),
            const SizedBox(height: 10),
            const Divider(color: Colors.black),
          ]),
        ),
      ),
    );
  }
}
