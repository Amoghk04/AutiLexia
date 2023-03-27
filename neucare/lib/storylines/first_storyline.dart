import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/base_storyline.dart';

class FirstStoryLine extends StatelessWidget {
  final User? user;
  const FirstStoryLine({super.key, required this.user});

  Widget _body() {
    return const Text("\n\nThis is the first story line.");
  }

  @override
  Widget build(BuildContext context) {
    return baseWidget("First Story Line", _body(), user);
  }
}
