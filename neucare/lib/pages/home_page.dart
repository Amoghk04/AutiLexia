import 'package:flutter/material.dart';
import 'package:neucare/pages/top_bar.dart';

class HomePage extends StatelessWidget {
  final String userName;
  const HomePage({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            TopBar(
              imagePath: 'lib/images/token.png',
              userName: userName,
            ),
          ],
        ));
  }
}
