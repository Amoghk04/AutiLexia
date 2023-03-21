import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TopBar extends HookWidget {
  final String imagePath;
  final String userName;
  const TopBar({super.key, required this.imagePath, required this.userName});

  @override
  Widget build(BuildContext context) {
    final tokens = useState(0);
    useEffect(() {
      // TODO: Get the current token value for the user from firebase.
      tokens.value = 0;
      return null;
    }, []);
    return Container(
        color: Colors.grey[300],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation Menu',
              onPressed: null,
            ),
            Row(children: [
              Text("${tokens.value}"),
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
