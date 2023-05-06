import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopBar extends HookWidget {
  final String imagePath;
  final User? user;
  const TopBar({super.key, required this.imagePath, required this.user});
  Widget _text(int tokens) {
    return Text(
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.grey.shade800,
        fontSize: 15.0,
      ),
      "$tokens",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Text(
            textScaleFactor: 0.7,
            style: TextStyle(color: Colors.black),
            "Tokens"),
        Image.asset(
          imagePath,
          scale: 9.0,
          alignment: Alignment.bottomCenter,
        ),
        const Text(
            textScaleFactor: 0.7, style: TextStyle(color: Colors.black), ": "),
        Stack(alignment: Alignment.centerLeft, children: [
          Container(
            padding:
                const EdgeInsets.only(left: 5, right: 25, top: 5, bottom: 3),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7.5),
                    bottomLeft: Radius.circular(7.5),
                    topRight: Radius.circular(7.5),
                    bottomRight: Radius.circular(7.5))),
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('name', isEqualTo: user?.email)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return _text(snapshot.data?.docs.first.get('tokens'));
                    }
                    return const Text("Loading...");
                  }
                  return const Text("Loading...");
                }),
          ),
        ]),
      ],
    );
  }
}
