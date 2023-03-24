import 'package:firebase_auth/firebase_auth.dart';
import 'package:neucare/auth.dart';
import 'package:neucare/components/app_drawer.dart';
import 'package:neucare/components/top_bar.dart';
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
          appBar:
              customAppBar(0, Colors.lightBlue[50], Colors.black, "Neucare"),
          drawer: AppDrawer(),
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  actions: const [],
                  pinned: true,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.transparent,
                  title: TopBar(imagePath: "lib/images/token.png", user: user),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => ListTile(
                        title: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      getStoryLineFromIndex(index)(user)));
                            },
                            child: const CircleAvatar(radius: 15))),
                    childCount: 50,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
