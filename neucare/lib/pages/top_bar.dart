import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopBar extends HookWidget {
  final String imagePath;
  final String? userName;
  const TopBar({super.key, required this.imagePath, required this.userName});

  @override
  Widget build(BuildContext context) {
    final tokenCount = useState(0);
    useEffect(() {
      // TODO: Get the token count from the user name.
      // for now, just incrementing it by 1.
      tokenCount.value += 1;
      return null;
    }, []);
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
            textScaleFactor: 0.7,
            style: TextStyle(color: Colors.grey.shade400),
            "Tokens: "),
        Stack(alignment: Alignment.centerLeft, children: [
          Container(
            padding:
                const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 3),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: Text(
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.grey.shade800,
              ),
              "${tokenCount.value}",
            ),
          ),
          Image.asset(
            imagePath,
            scale: 4,
          ),
        ]),
      ],
    ));
  }
}
