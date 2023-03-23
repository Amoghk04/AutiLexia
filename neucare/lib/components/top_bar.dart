import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopBar extends HookWidget {
  final String imagePath;
  final User? user;
  const TopBar({super.key, required this.imagePath, required this.user});

  @override
  Widget build(BuildContext context) {
    final tokenCount = useState(0);
    useEffect(() {
      // TODO: Get the token count from the user name.
      // for now, just incrementing it by 1.
      tokenCount.value += 1;
      return null;
    }, []);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        const Text(
            textScaleFactor: 0.7,
            style: TextStyle(color: Colors.black),
            "Tokens: "),
        Stack(alignment: Alignment.centerLeft, children: [
          Container(
            padding:
                const EdgeInsets.only(left: 5, right: 15, top: 5, bottom: 3),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(7.5),
                    bottomLeft: Radius.circular(7.5))),
            child: Text(
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 15.0,
              ),
              "${tokenCount.value}",
            ),
          ),
          Image.asset(
            imagePath,
            scale: 4.0,
          ),
        ]),
      ],
    );
  }
}
