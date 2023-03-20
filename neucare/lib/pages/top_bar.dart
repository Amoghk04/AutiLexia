import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String imagePath;
  const TopBar({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation Menu',
              onPressed: null,
            ),
            Row(children: [
              const Text("0"),
              Image.asset(
                imagePath,
                height: 90,
                width: 90,
              )
            ]),
          ],
        ));
  }
}
