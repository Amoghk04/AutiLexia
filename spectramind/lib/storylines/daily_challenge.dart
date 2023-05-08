import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:spectramind/components/app_bar.dart';
import 'package:spectramind/components/custom_container.dart';
import 'package:spectramind/db.dart';

class DailyChallenge extends HookWidget {
  final User? user;
  const DailyChallenge({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    final challengeCompleted = useState(false);
    final formattedCurrentDate = useState("");
    useEffect(() {
      DateTime currentDate = DateTime.now();
      formattedCurrentDate.value = DateFormat.yMMMd().format(currentDate);
      FirebaseFirestore.instance
          .collection('users')
          .where('name', isEqualTo: user?.email)
          .get()
          .then((matches) async {
        String? lastDailyChallenge = matches.docs[0].get('last_challenge');
        if (lastDailyChallenge == null) {
          challengeCompleted.value = false;
          await DatabaseManager().updateUserLastDailyChallenge(
              email: user?.email,
              lastDailyChallenge: formattedCurrentDate.value);
        } else if (lastDailyChallenge == formattedCurrentDate.value) {
          challengeCompleted.value = true;
        } else {
          challengeCompleted.value = false;
        }
      });
      return null;
    }, []);
    return customContainer(
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: customAppBar(Colors.lightBlue[50], Colors.black, user),
            ),
            (!challengeCompleted.value)
                ? ElevatedButton(
                    onPressed: () {
                      DatabaseManager()
                          .updateUserLastDailyChallenge(
                              email: user?.email,
                              lastDailyChallenge: formattedCurrentDate.value)
                          .then((_) {
                        Navigator.of(context).pop();
                      });
                    },
                    child: const Text("Submit"))
                : Column(children: const [
                    SizedBox(height: 50),
                    Text("Daily Challenge Completed!",
                        style: TextStyle(
                          fontFamily: 'LuckiestGuy',
                          fontSize: 20,
                        )),
                    Text("Come back tomorrow!",
                        style: TextStyle(
                          fontFamily: 'LuckiestGuy',
                          fontSize: 20,
                        ))
                  ])
          ]),
        ),
      ),
    );
  }
}
