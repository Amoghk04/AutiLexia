import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neucare/components/base_storyline.dart';

class SecondStoryLine extends StatelessWidget {
  final User? user;
  const SecondStoryLine({super.key, required this.user});

  Widget _body() {
    return const Text("\n\nThis is the second story line.");
  }

  @override
  Widget build(BuildContext context) {
    return baseWidget("Second Story Line", _body(), user);
  }
}
